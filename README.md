# AWS Cloud Security Baseline (Terraform)

A hands-on cloud security engineering project focused on designing, deploying and validating security controls in AWS using Terraform.

The project establishes a foundational AWS environment covering identity, network segmentation, centralised logging, encryption and configuration visibility.

Its longer-term goal is to evolve into a **Cloud Security Operations Platform** supporting threat detection, investigation, controlled response and security automation.

## Project Status

**Current milestone:** Phase 3 — Core Logging and Configuration Visibility Deployment Verified (28 October 2026).

| Phase | Focus | Status |
|---|---|---|
| 1 | Identity and Account Security | Baseline implemented |
| 2 | Network Security | Baseline implemented |
| 3 | Logging and Configuration Visibility | Core deployment verified |
| 4 | Detection and Monitoring | Planned |
| 5 | Security Playbooks and Response | Planned |
| 6 | Security Automation | Planned |

The project is actively developed, with further security hardening and verification planned.

---

## Implemented Security Controls

### Identity and Account Security

- Terraform-managed IAM account password policy.
- Password complexity, expiration and reuse controls.
- AWS service IAM roles and resource-based permissions.

### Network Security

- Custom VPC in `ap-southeast-2` (Sydney).
- Public and private subnets.
- Separate public and private route tables.
- Internet Gateway and public internet routing.
- Private subnet without direct internet routing.
- Parameterised Terraform network configuration.

### Logging and Configuration Visibility

- Multi-region AWS CloudTrail.
- Global service event logging.
- Centralised S3 logging bucket.
- S3 Block Public Access and versioning.
- Customer-managed AWS KMS key.
- SSE-KMS encryption for CloudTrail log objects.
- AWS Config configuration recorder and delivery channel.
- Terraform-managed S3, IAM and KMS permissions.

---

## Architecture Overview

```text id="d9h2j1"
                       AWS Account
                            |
             +--------------+--------------+
             |              |              |
             v              v              v
            IAM            VPC         Visibility
             |              |              |
        IAM Controls   +----+----+   +-----+------+
                       |         |   |            |
                     Public   Private CloudTrail AWS Config
                     Subnet   Subnet      |           |
                                         +-----+-----+
                                               |
                                               v
                                        S3 Log Bucket
                                               |
                                          Uses SSE-KMS
                                               |
                                               v
                                       Customer-Managed
                                           KMS Key
```

The diagram is a logical representation of the architecture. CloudTrail and AWS Config operate as AWS services independently of the VPC subnets.

For a more detailed explanation, see [Architecture Documentation](docs/architecture.md).

---

## Deployment Verification

Infrastructure deployment was followed by AWS CLI checks to confirm that the services were operating as intended.

| Control | Verified outcome |
|---|---|
| Terraform | Deployment successful: 4 added, 3 changed, 0 destroyed |
| CloudTrail | Multi-region logging enabled and log delivery confirmed |
| KMS encryption | A delivered CloudTrail log object used `aws:kms` with the configured customer-managed key |
| S3 | Default SSE-KMS encryption and public-access blocking configured |
| AWS Config | Recorder enabled and operational status successful |
| AWS Config snapshot | Explicit snapshot delivery reported `SUCCESS` |
| GitHub | Terraform deployment committed and pushed successfully |

AWS Config's ongoing configuration history delivery has not yet been independently verified.

The distinction between configured controls and verified outcomes is intentional. The project prioritises observable evidence over deployment success alone.

---

## Security Investigations

CloudTrail has also been used to investigate real AWS activity and deployment issues.

Completed investigations include:

- Analysis of AWS-managed KMS activity.
- Investigation of failed AWS Config API requests.
- Diagnosis of an S3 delivery permissions error.
- Terraform state recovery and resource reconciliation.
- Verification of customer-managed KMS encryption on delivered CloudTrail logs.
- AWS Config snapshot delivery validation.

These investigations demonstrate how logging supports both security analysis and operational troubleshooting.

See [CloudTrail Security Investigations](docs/investigations/cloudtrail-investigations.md).

---

## Tools and Technologies

| Technology | Purpose |
|---|---|
| Terraform | Infrastructure as Code |
| AWS IAM | Identity and service permissions |
| Amazon VPC | Network segmentation |
| AWS CloudTrail | API activity auditing |
| AWS Config | Resource configuration visibility |
| Amazon S3 | Centralised log storage |
| AWS KMS | Encryption key management |
| AWS CLI | Deployment verification and investigation |
| Git and GitHub | Version control and documentation |

---

## Documentation

- [Architecture](docs/architecture.md) — Current architecture, security layers and design principles.
- [Roadmap](docs/roadmap.md) — Completed milestones and future implementation phases.
- [Lessons Learned](docs/lessons-learned.md) — Technical challenges, decisions and engineering lessons.
- [CloudTrail Investigations](docs/investigations/cloudtrail-investigations.md) — Investigation evidence, troubleshooting and verification.
- [Documentation Index](docs/index.md) — Navigation to project documentation.

---

## Next Steps

The next major phase will focus on security detection and monitoring.

Planned work includes evaluating Amazon GuardDuty, CloudWatch monitoring, security findings and event-driven alerting.

Before expanding the platform, additional hardening work will include reviewing IAM and KMS permissions, assessing logging costs and retention, and verifying ongoing AWS Config configuration history delivery.

Future phases will introduce security playbooks, controlled automation, behaviour analytics and security for AI workloads.

---

## Engineering Approach

This project follows a practical engineering workflow:

**Design → Implement → Validate → Investigate → Improve → Document**

The goal is not simply to deploy AWS security services. It is to understand how cloud security controls interact, verify their behaviour, troubleshoot failures and build reliable infrastructure through repeatable engineering practices.

The project serves as a practical portfolio of AWS cloud security architecture, infrastructure as code and operational problem-solving.