# AWS Cloud Security Baseline (Terraform)

This project documents my hands-on work building a security-focused AWS environment using Terraform.

The goal is to develop practical cloud security skills by implementing foundational security controls, understanding the reasoning behind each control, and applying security-by-design principles throughout the build process.

The project is being developed progressively across identity, networking, logging, configuration visibility, investigation, monitoring, and security automation.

---

## Purpose

Cloud security is not just about deploying infrastructure. It is about designing environments that are secure, observable, auditable, and maintainable from the beginning.

This repository began as an AWS security baseline and serves as the foundation for a broader cloud security operations project focused on visibility, threat detection, investigation, automation, and continuous improvement.

---

## What This Project Includes

### Identity and Account Security

- IAM account password policy managed through Terraform
- Password complexity and reuse controls
- AWS service IAM role configuration
- Identity-focused security design

### Network Security

- Custom AWS VPC
- Public and private subnet separation
- Separate public and private route tables
- Internet Gateway configuration for the public subnet
- Private subnet without direct internet routing
- Parameterised network configuration using Terraform variables

### Logging and Configuration Visibility

- Multi-region AWS CloudTrail
- Global AWS service event logging
- Centralised S3 log storage
- S3 public-access blocking
- S3 versioning
- AWS KMS encryption
- Automatic KMS key rotation
- AWS Config configuration recording
- AWS Config delivery channel configuration

### Cloud Security Investigation

CloudTrail is also being used as an investigation and troubleshooting tool rather than only as a logging service.

Investigation exercises include:

- Analysing AWS-managed KMS events
- Distinguishing AWS service activity from user activity
- Investigating failed AWS API requests
- Identifying Terraform-generated activity through CloudTrail metadata
- Tracing an AWS Config delivery failure to an S3 permissions issue

---

## Current Architecture

The project currently covers three primary security layers:

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
