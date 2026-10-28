# CloudTrail Security Investigations

## Overview

This document records practical investigations conducted while developing the AWS Cloud Security Baseline using Terraform.

The investigations focus on interpreting AWS CloudTrail management events, diagnosing AWS service integration failures and verifying the operation of deployed security logging infrastructure.

The objective is to demonstrate how cloud security engineers use audit evidence, AWS CLI commands and infrastructure configuration to investigate unexpected behaviour and validate security controls.

---

## Investigation 1 – AWS Internal KMS Key Deletion

### Objective

Investigate an AWS-managed CloudTrail event and determine what occurred using the available event metadata.

### Evidence

| Field | Value |
|---|---|
| Event Name | `DeleteKey` |
| Event Source | `kms.amazonaws.com` |
| Region | `ap-southeast-2` |
| User Identity | AWS Internal |
| Source IP | AWS Internal |
| Event Type | Management Event |
| Read Only | `false` |

### Interpretation

CloudTrail recorded a management event associated with the deletion of a KMS key.

The event identified AWS internal activity rather than a named IAM user or an external source IP address. The `readOnly: false` field indicated a write-type management operation.

The event also referenced the affected KMS key through its ARN.

Based on the observed metadata, the activity appeared to originate from an AWS-managed process rather than a directly identified human user. However, the event alone does not establish the broader reason for the deletion.

### Security Significance

CloudTrail records relevant AWS service activity in addition to user-initiated actions.

Security investigations must distinguish AWS-managed operations from potentially unauthorised activity by examining identity, event source, affected resources and surrounding context.

### Key Learnings

- CloudTrail management events provide visibility into AWS infrastructure operations.
- Identity metadata helps distinguish service activity from named user activity.
- Write-type events indicate operations that may modify resource state.
- An event record provides evidence of activity but may not fully explain its underlying cause.

---

## Investigation 2 – AWS Config Delivery Channel Failure

### Objective

Investigate a failed AWS Config API request and identify the cause of the deployment failure.

### Evidence

| Field | Value |
|---|---|
| Event Name | `PutDeliveryChannel` |
| IAM User | `cli-admin` |
| AWS Service | AWS Config |
| Deployment Tool | Terraform |
| Region | `ap-southeast-2` |
| Error Code | `InsufficientDeliveryPolicyException` |

### Problem

Terraform attempted to create an AWS Config delivery channel using the centralised S3 logging bucket.

The API request failed because AWS Config did not have sufficient permissions to use the destination bucket.

### Investigation

The failed API request was visible in CloudTrail.

The event metadata identified the initiating identity, the AWS service, the attempted operation and the error returned by AWS.

The `InsufficientDeliveryPolicyException` indicated a permissions problem involving the delivery destination.

This directed troubleshooting toward the S3 bucket policy and the permissions required for AWS Config delivery.

### Resolution

The logging configuration was updated to include the necessary AWS Config access permissions.

The Terraform deployment was subsequently completed successfully, and the AWS Config delivery channel was created.

A later snapshot delivery test confirmed that the snapshot delivery path was operational.

### Security Significance

This investigation demonstrated that CloudTrail is valuable for both security investigations and infrastructure troubleshooting.

Failed API events can reveal misconfigured service integrations, missing permissions and unsuccessful deployment operations.

### Key Learnings

- CloudTrail records unsuccessful AWS API requests.
- Error codes provide useful diagnostic evidence.
- Service integrations depend on correctly scoped resource permissions.
- Terraform deployment errors can be investigated using AWS audit records.
- Successful resource creation should be followed by operational verification.

---

## Investigation 3 – Phase 3 Logging Deployment and KMS Verification

### Objective

Deploy and validate the Phase 3 security logging infrastructure, including multi-region CloudTrail, centralised S3 storage, customer-managed KMS encryption and AWS Config recording.

The goal was to verify that security logging services operated correctly rather than relying only on a successful Terraform deployment.

### Problem

The deployment required several AWS services to work together.

Terraform state needed to be reconciled with existing AWS resources, while CloudTrail and AWS Config required appropriate S3 and KMS permissions.

These dependencies created a risk that Terraform could report a successful configuration while actual log delivery or encryption remained unverified.

### Investigation and Recovery

#### 1. Terraform State Recovery

Existing AWS resources and the local Terraform state required reconciliation.

The recovery process involved inspecting deployed resources, importing existing resources where appropriate and validating the resulting Terraform configuration.

This avoided unnecessarily recreating existing infrastructure and helped preserve the deployed environment.

The configuration was subsequently validated and applied successfully.

#### 2. Service Permissions

CloudTrail and AWS Config required permission to interact with the centralised logging bucket and customer-managed KMS key.

The relevant Terraform policies were adjusted to support authorised service operations.

This reinforced the distinction between IAM role permissions, S3 bucket policies and KMS key policies.

#### 3. Terraform Deployment

The final Terraform deployment completed with:

| Action | Resources |
|---|---:|
| Added | 4 |
| Changed | 3 |
| Destroyed | 0 |

No resources were destroyed during the deployment.

### CloudTrail Verification

The CloudTrail service status was checked using the AWS CLI.

```bash
aws cloudtrail get-trail-status \
  --name cloud-security-baseline \
  --region ap-southeast-2
```

The response confirmed that logging was enabled and reported successful log delivery without a current delivery error.

The trail configuration was also inspected to confirm the intended S3 bucket and KMS key.

```bash
aws cloudtrail describe-trails \
  --trail-name-list cloud-security-baseline \
  --region ap-southeast-2
```

### KMS Encryption Verification

An earlier CloudTrail object was inspected and reported `AES256` encryption without an associated customer-managed KMS key.

Rather than treating the trail configuration alone as proof of encryption, a newer delivered CloudTrail object was selected and inspected.

```bash
aws s3api head-object \
  --bucket aws-security-logs-551529689356-dcb65d03 \
  --key "AWSLogs/551529689356/CloudTrail/ap-southeast-2/2026/10/28/551529689356_CloudTrail_ap-southeast-2_20261028T1220Z_pqrSvMVvsudAJY5x.json.gz" \
  --query '{Encryption:ServerSideEncryption,KMSKey:SSEKMSKeyId,LastModified:LastModified}'
```

The returned metadata confirmed:

| Property | Verified result |
|---|---|
| Server-side encryption | `aws:kms` |
| KMS key | Configured customer-managed KMS key |
| S3 object | Newly delivered CloudTrail log |
| Delivery date | 28 October 2026 |

This provided direct evidence that CloudTrail was delivering encrypted log objects using the intended KMS key.

The earlier `AES256` object was not treated as evidence of a current encryption failure because a later object successfully demonstrated the intended configuration.

### AWS Config Verification

The AWS Config recorder was checked using:

```bash
aws configservice describe-configuration-recorder-status \
  --region ap-southeast-2
```

The recorder reported that recording was