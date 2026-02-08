variable "aws_region" {
  description = "AWS region for the environment"
  type        = string
  default     = "ap-southeast-2"
}

variable "project_name" {
  description = "Project name used for tagging"
  type        = string
  default     = "cloud-security-baseline"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "az" {
  description = "Availability Zone for subnets (start single-AZ; we can expand later)"
  type        = string
  default     = "ap-southeast-2a"
}
