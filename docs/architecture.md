# Cloud Security Operations Platform Architecture

## Current Architecture

```text
                         AWS Account
                             |
              +--------------+--------------+
              |              |              |
              v              v              v
             IAM            VPC        Visibility
              |              |              |
       Account Controls      |       +------+------+
                             |       |             |
                       +-----+-----+ v             v
                       |           | CloudTrail  AWS Config
                    Public      Private    |          |
                    Subnet      Subnet     +----+-----+
                       |                       |
                Internet Gateway              v
                                         S3 Log Storage
                                               |
                                               v
                                         KMS Encryption
```

### Current Security Layers

The current architecture establishes security foundations across identity, networking, logging, encryption, and configuration visibility.

### Identity

- IAM account password policy
- Password complexity and reuse controls
- AWS service IAM roles

### Network

- Custom VPC
- Public and private subnets
- Separate public and private route tables
- Internet Gateway for public connectivity
- Private subnet without direct internet routing

### Visibility and Logging

- Multi-region AWS CloudTrail
- AWS Config configuration recording
- Centralised S3 log storage
- S3 public-access blocking
- S3 versioning
- AWS KMS encryption
- Automatic KMS key rotation

The environment is managed through Terraform to provide repeatable and auditable infrastructure configuration.

---

## Future Architecture

The architecture will progressively extend the existing security baseline into detection, investigation, response, and automation.

```text
Secure Infrastructure
        |
        v
Visibility
        |
        v
Detection
        |
        v
Investigation
        |
        v
Response
        |
        v
Automation
```

Future capabilities may include CloudWatch monitoring, GuardDuty threat detection, security alerting, EventBridge-based event processing, Lambda automation, and SNS notifications.

Detailed implementation phases are maintained in the project roadmap.

---

## Architectural Principles

The platform is designed around five core principles:

1. Visibility
2. Security by Design
3. Operational Understanding
4. Automation
5. Continuous Improvement

These principles guide the evolution of the project from foundational AWS security controls toward broader cloud security operations.

---

## Long-Term Vision

This project began as an AWS Cloud Security Baseline built with Terraform.

The long-term vision is to evolve it into a Cloud Security Operations Platform that demonstrates how secure infrastructure develops into visibility, detection, investigation, response, and automation.

The objective is not simply to deploy AWS services, but to understand how security controls interact and how secure cloud environments are designed, monitored, investigated, and continuously improved.
