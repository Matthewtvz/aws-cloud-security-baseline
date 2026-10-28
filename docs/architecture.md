# Cloud Security Operations Platform Architecture

## Current Architecture

The AWS Cloud Security Baseline is deployed using Terraform, with its primary infrastructure configured in the `ap-southeast-2` (Sydney) region. It establishes foundational identity, networking, encryption, logging and configuration visibility controls.

```text
                         AWS Account
                              |
           +------------------+------------------+
           |                  |                  |
           v                  v                  v
          IAM                VPC              Visibility
           |                  |                  |
    Account Controls   +------+------+    +------+------+
                       |             |    |             |
                       v             v    v             v
                     Public       Private CloudTrail  AWS Config
                     Subnet       Subnet      |            |
                       |             |       |            |
                   Route to      No direct    +------+-----+
                   Internet      internet           |
                   Gateway       route              v
                                            Centralised S3
                                              Log Bucket
                                                  |
                                             Uses SSE-KMS
                                                  |
                                                  v
                                            Customer-Managed
                                               KMS Key
```

This diagram represents the logical security architecture rather than a complete network traffic flow. CloudTrail and AWS Config are AWS account-level services and do not depend on the VPC subnets.

The S3 logging bucket uses server-side encryption with AWS KMS (SSE-KMS). The customer-managed KMS key protects the encryption keys used for stored log objects; it is not a separate destination through which logs travel.

---

## Current Security Layers

### Identity and Access Management

- IAM account password policy with password complexity and reuse requirements.
- AWS service roles for logging and configuration recording.
- Resource-based policies governing CloudTrail, AWS Config, S3 and KMS integrations.
- Scoped permissions supporting authorised service operations.

These controls establish identity and access boundaries for the security infrastructure.

### Network Security

- Custom VPC with public and private subnets.
- Separate public and private route tables.
- Internet Gateway and public route for internet connectivity.
- Private subnet without a direct route to the Internet Gateway.

The network provides a foundation for future private workloads, network segmentation and additional security controls.

A public subnet route does not automatically make every resource publicly accessible. Actual access also depends on resource configuration and applicable network security controls.

### Visibility and Logging

- Multi-region AWS CloudTrail for recording supported AWS account activity.
- AWS Config configuration recorder for supported resource configuration changes.
- Centralised S3 bucket for CloudTrail logs and AWS Config delivery.
- S3 Block Public Access and bucket versioning.
- Customer-managed AWS KMS key for encryption.
- Terraform-managed logging, storage and encryption policies.

CloudTrail provides an audit trail of supported AWS API activity, while AWS Config provides information about supported resource configurations and changes.

These services provide complementary visibility capabilities.

### Encryption and Access Boundaries

The S3 logging bucket uses SSE-KMS as its default encryption configuration. CloudTrail is explicitly configured to use the customer-managed KMS key.

KMS key policies and IAM permissions support authorised service access to cryptographic operations. S3 bucket policies govern which services can write to the centralised logging destination.

CloudTrail does not enforce permissions on AWS activity; it records events for auditing and investigation. Similarly, AWS Config provides configuration visibility rather than replacing preventive security controls.

These distinctions preserve separation between security enforcement, monitoring and evidence