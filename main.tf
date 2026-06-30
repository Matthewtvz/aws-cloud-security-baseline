############################################
# PHASE 3 — LOGGING (CLEAN WORKING VERSION)
############################################

data "aws_caller_identity" "current" {}

resource "random_id" "suffix" {
  byte_length = 4
}
locals {
  log_bucket_name = "aws-security-logs-${data.aws_caller_identity.current.account_id}-${random_id.suffix.hex}"
  trail_name      = "cloud-security-baseline"
}
# KMS KEY FOR LOG ENCRYPTION
# ############################################

resource "aws_kms_key" "logs" {
  description         = "KMS key for CloudTrail and AWS Config logs"
  enable_key_rotation = true
}

resource "aws_kms_alias" "logs" {
  name          = "alias/cloud-security-logs"
  target_key_id = aws_kms_key.logs.key_id
}

############################################
# S3 BUCKET FOR LOG STORAGE
############################################

resource "aws_s3_bucket" "logs" {
  bucket = local.log_bucket_name
}
resource "aws_s3_bucket_policy" "cloudtrail" {
  bucket = aws_s3_bucket.logs.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AWSCloudTrailAclCheck"
        Effect = "Allow"
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }
        Action   = "s3:GetBucketAcl"
        Resource = aws_s3_bucket.logs.arn
      },
      {
        Sid    = "AWSCloudTrailWrite"
        Effect = "Allow"
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }
        Action   = "s3:PutObject"
        Resource = "${aws_s3_bucket.logs.arn}/AWSLogs/${data.aws_caller_identity.current.account_id}/*"

        Condition = {
          StringEquals = {
            "s3:x-amz-acl" = "bucket-owner-full-control"
          }
        }
      }
    ]
  })
}

resource "aws_s3_bucket_public_access_block" "logs" {
  bucket = aws_s3_bucket.logs.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "logs" {
  bucket = aws_s3_bucket.logs.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "logs" {
  bucket = aws_s3_bucket.logs.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = aws_kms_key.logs.arn
    }
  }
}

############################################
# CLOUDTRAIL
############################################

resource "aws_cloudtrail" "main" {
  name                          = local.trail_name
  s3_bucket_name                = aws_s3_bucket.logs.bucket
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_logging                = true
  kms_key_id                    = aws_kms_key.logs.arn
}

############################################
# AWS CONFIG IAM ROLE + POLICY
############################################

resource "aws_iam_role" "config" {
  name = "aws-config-recorder-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "config.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "config_managed" {
  role       = aws_iam_role.config.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRole"
}

############################################
# AWS CONFIG RECORDER + DELIVERY CHANNEL
############################################

resource "aws_config_configuration_recorder" "recorder" {
  name     = "default"
  role_arn = aws_iam_role.config.arn

  recording_group {
    all_supported = true
  }
}

resource "aws_config_delivery_channel" "channel" {
  name           = "default"
  s3_bucket_name = aws_s3_bucket.logs.bucket
  s3_key_prefix  = "config"
}

resource "aws_config_configuration_recorder_status" "recorder_status" {
  name       = aws_config_configuration_recorder.recorder.name
  is_enabled = true

  depends_on = [aws_config_delivery_channel.channel]
}

############################################
# OUTPUTS
############################################

output "log_bucket_name" {
  value = aws_s3_bucket.logs.bucket
}

output "kms_key_arn" {
  value = aws_kms_key.logs.arn
}

