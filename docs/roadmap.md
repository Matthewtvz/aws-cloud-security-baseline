# Cloud Security Operations Platform Roadmap

## Overview

This repository began as an AWS Cloud Security Baseline focused on building practical cloud security skills through Terraform and hands-on AWS implementation.

The project is being developed progressively from secure infrastructure foundations into visibility, detection, investigation, response, and automation.

The roadmap is guided by five core principles:

1. Visibility
2. Security by Design
3. Operational Understanding
4. Automation
5. Continuous Improvement

---

# Phase 1 – Identity and Account Security

## Objective

Establish foundational identity and account-level security controls.

## Implemented

- IAM account password policy
- Password complexity requirements
- Password reuse prevention
- Password expiration configuration
- AWS service IAM role configuration
- Terraform-based IAM configuration

## Continuing Development

- Least-privilege IAM design
- MFA controls
- IAM policy hardening

## Outcome

Develop an understanding of identity as the foundation of cloud security and establish baseline account security controls.

---

# Phase 2 – Network Security

## Objective

Create a segmented AWS network architecture using Infrastructure as Code.

## Implemented

- Custom AWS VPC
- Public subnet
- Private subnet
- Separate public and private route tables
- Internet Gateway
- Public internet routing
- Private subnet without direct internet routing
- Parameterised network configuration

## Continuing Development

- Security groups
- Additional network controls
- Multi-AZ architecture
- Private service connectivity

## Outcome

Establish a network foundation that separates public and private infrastructure and can support future workloads.

---

# Phase 3 – Logging and Configuration Visibility

## Objective

Create audit and configuration visibility across the AWS environment.

## Implemented

- Multi-region AWS CloudTrail
- Global service event logging
- Centralised S3 log storage
- S3 public-access blocking
- S3 versioning
- AWS KMS encryption
- Automatic KMS key rotation
- AWS Config configuration recorder
- AWS Config delivery channel
- AWS Config service IAM role

## Investigation Work

CloudTrail has also been used for practical investigation and troubleshooting, including:

- Analysing AWS-managed service activity
- Distinguishing service activity from user activity
- Investigating failed API requests
- Identifying Terraform-generated AWS activity
- Tracing an AWS Config delivery failure to S3 permission requirements

## Continuing Development

- Validate service permissions
- Harden logging configuration
- Continue CloudTrail investigation exercises
- Improve infrastructure structure and modularisation

## Outcome

Establish the visibility required to understand infrastructure changes, AWS activity, deployment failures, and security-relevant events.

---

# Phase 4 – Detection and Monitoring

## Objective

Build on the existing visibility layer by introducing security monitoring and threat detection.

## Planned Services

- Amazon GuardDuty
- Amazon CloudWatch
- CloudTrail enhancements
- Security alerting

## Focus Areas

- Threat detection
- Security event monitoring
- Configuration-change awareness
- Security findings
- Operational alerting

## Outcome

Move from collecting security evidence toward identifying activity that may require investigation.

---

# Phase 5 – Security Playbooks and Response

## Objective

Develop repeatable investigation and response procedures for common cloud security scenarios.

## Planned Playbooks

- Root Account Activity
- Public S3 Bucket Exposure
- IAM Permission Changes
- Security Group Misconfiguration
- Suspicious API Activity

## Focus Areas

- Event triage
- Evidence collection
- Investigation
- Response decisions
- Documentation

## Outcome

Create repeatable operational processes for investigating and responding to cloud security events.

---

# Phase 6 – Security Automation

## Objective

Automate selected security processes after the underlying detection and response procedures are understood.

## Planned Services

- Amazon EventBridge
- AWS Lambda
- Amazon SNS

## Potential Automations

- Root account activity notifications
- Public bucket detection
- IAM change notifications
- Security configuration validation
- Security finding notifications

## Outcome

Reduce repetitive manual work and improve the speed and consistency of selected security responses.

---

# Longer-Term – Behaviour Analytics

## Objective

Explore how security events can be analysed together to identify behavioural patterns and potential risk.

## Areas of Interest

- User activity monitoring
- Unusual IAM activity
- Abnormal API usage
- Excessive resource access
- Detection engineering
- Behaviour baselining

## Outcome

Develop an understanding of how security teams can move from individual alerts toward identifying patterns of suspicious activity.

---

# Longer-Term – Secure AI Workloads

## Objective

Apply cloud security principles to AI-based workloads after the core cloud security platform is more mature.

## Areas of Interest

- AWS Bedrock
- AI threat modelling
- Secure RAG architectures
- Prompt injection defence
- AI workload logging and monitoring
- Data protection and governance

## Outcome

Explore how identity, secure architecture, visibility, monitoring, and data protection extend into modern AI environments.

---

# Long-Term Goal

Develop practical cloud security engineering skills by progressing through:

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

The emphasis throughout the project is on understanding how security controls work together rather than simply deploying AWS services.

Each phase builds on the previous one, allowing the project to evolve as both the infrastructure and my understanding of cloud security mature.
