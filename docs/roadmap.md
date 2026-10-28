# Cloud Security Operations Platform Roadmap

## Overview

This repository began as an AWS Cloud Security Baseline focused on developing practical cloud security engineering skills through Terraform and hands-on AWS implementation.

The project is evolving progressively from secure infrastructure foundations into visibility, detection, investigation, response and automation.

Development follows five principles:

1. Visibility
2. Security by Design
3. Operational Understanding
4. Automation
5. Continuous Improvement

## Project Progress

| Phase | Focus | Status |
|---|---|---|
| Phase 1 | Identity and Account Security | Baseline implemented; hardening ongoing |
| Phase 2 | Network Security | Baseline implemented; expansion planned |
| Phase 3 | Logging and Configuration Visibility | Core deployment verified; hardening ongoing |
| Phase 4 | Detection and Monitoring | Planned |
| Phase 5 | Security Playbooks and Response | Planned |
| Phase 6 | Security Automation | Planned |

---

## Phase 1 – Identity and Account Security

### Objective

Establish foundational identity and account-level security controls.

### Implemented

- IAM account password policy.
- Password complexity requirements.
- Password reuse prevention.
- Password expiration configuration.
- AWS service IAM roles.
- Terraform-managed IAM configuration.

### Continuing Development

- Review and reduce IAM permissions toward least privilege.
- Assess MFA enforcement and account protection.
- Review IAM policy scope and service role permissions.
- Evaluate temporary credentials and role-based administrative access.

### Outcome

Establish baseline identity controls and develop an understanding of how IAM policies, roles and resource permissions interact.

---

## Phase 2 – Network Security

### Objective

Create a segmented AWS network architecture using Infrastructure as Code.

### Implemented

- Custom AWS VPC.
- Public and private subnets.
- Separate public and private route tables.
- Internet Gateway.
- Public internet routing.
- Private subnet without direct internet routing.
- Parameterised network configuration.

### Continuing Development

- Introduce security groups for future workloads.
- Extend the architecture across multiple Availability Zones.
- Evaluate private connectivity through VPC endpoints.
- Assess network access controls and traffic visibility.
- Test connectivity and isolation assumptions.

### Outcome

Establish a network foundation that separates public and private connectivity and can support future secure workloads.

---

## Phase 3 – Logging and Configuration Visibility

### Objective

Establish reliable audit logging, encrypted storage and configuration visibility across the AWS environment.

### Implemented

- Multi-region AWS CloudTrail.
- Global service event logging.
- Centralised S3 logging bucket.
- S3 Block Public Access.
- S3 versioning.
- Default SSE-KMS bucket encryption.
- Customer-managed AWS KMS key.
- KMS key rotation configuration.
- AWS Config configuration recorder.
- AWS Config delivery channel.
- AWS Config service IAM role.
- Terraform-managed logging permissions and policies.

### Operational Verification – 28 October 2026

The Phase 3 infrastructure was deployed successfully using Terraform.

Verification confirmed:

- CloudTrail logging was enabled.
- CloudTrail log objects were being delivered to S3.
- A newly delivered CloudTrail object used `aws:kms` encryption with the configured customer-managed key.
- The S3 bucket had default SSE-KMS encryption configured.
- AWS Config recording was enabled and reported a successful status.
- An explicitly requested AWS Config configuration snapshot reported successful delivery.
- The deployed Terraform configuration was committed and synchronized with GitHub.

The successful snapshot confirms the AWS Config snapshot delivery path. Ongoing configuration history delivery has not yet been independently verified.

### Investigation Work

Practical investigations included:

- Analysing AWS-managed KMS activity in CloudTrail.
- Distinguishing AWS service operations from named user activity.
- Investigating failed AWS API requests.
- Identifying Terraform-generated activity.
- Diagnosing AWS Config S3 delivery permissions.
- Recovering and reconciling Terraform state.
- Verifying actual CloudTrail log encryption.
- Resolving Git branch synchronization issues.

### Continuing Development

- Verify ongoing AWS Config configuration history delivery.
- Review logging bucket and KMS policies for least privilege.
- Evaluate log retention, lifecycle rules and associated costs.
- Consider CloudTrail log file integrity validation.
- Improve Terraform modularisation and state management.
- Continue practical CloudTrail investigations.

### Outcome

Establish a verified logging and configuration visibility foundation that supports future security monitoring, investigation and detection capabilities.

**Milestone:** Core Phase 3 deployment operationally verified on 28 October 2026.

---

## Phase 4 – Detection and Monitoring

### Status

Planned — next major implementation phase.

### Objective

Build on the verified visibility layer to detect security-relevant activity and produce actionable alerts.

### Planned Capabilities

- Amazon GuardDuty threat detection.
- Amazon CloudWatch monitoring and alerting.
- AWS Security Hub evaluation.
- CloudTrail-based security event detection.
- Basic security notification workflows.

### Proposed Implementation Sequence

1. Review the current logging environment, service costs and monitoring requirements.
2. Enable a selected detection capability in a controlled scope.
3. Establish a small set of security-relevant detection scenarios.
4. Generate or identify suitable test events.
5. Verify findings or alerts using AWS CLI evidence.
6. Document detection limitations and operational lessons.

### Focus Areas

- Threat detection.
- Suspicious AWS API activity.
- IAM and root account activity.
- Configuration-change awareness.
- Security findings and alert triage.
- Detection accuracy and operational usefulness.

### Outcome

Progress from collecting security evidence to identifying events that may require investigation.

---

## Phase 5 – Security Playbooks and Response

### Status

Planned.

### Objective

Develop repeatable investigation and response procedures for common cloud security scenarios.

### Planned Playbooks

- Root Account Activity.
- Public S3 Bucket Exposure.
- IAM Permission Changes.
- Security Group Misconfiguration.
- Suspicious API Activity.

### Focus Areas

- Event identification.
- Evidence collection.
- Severity assessment.
- Investigation and triage.
- Response decisions.
- Documentation and lessons learned.

### Outcome

Create consistent, auditable procedures for investigating and responding to security events before introducing automated remediation.

---

## Phase 6 – Security Automation

### Status

Planned.

### Objective

Automate selected security processes after detection logic and response procedures have been tested and understood.

### Planned Services

- Amazon EventBridge.
- AWS Lambda.
- Amazon SNS.

### Potential Automations

- Root account activity notifications.
- Public bucket exposure alerts.
- IAM change notifications.
- Security configuration validation.
- Security finding notifications.
- Approved, narrowly scoped remediation workflows.

### Design Considerations

- Least-privilege execution roles.
- Explicit conditions for automated actions.
- Logging and traceability.
- Safe failure behaviour.
- Human approval for higher-impact actions.
- Testing before production use.

### Outcome

Improve the speed and consistency of selected security operations without introducing unnecessary automated privileges or operational risk.

---

## Longer-Term – Behaviour Analytics

### Objective

Explore how security events can be analysed together to identify behavioural patterns and potential risk.

### Areas of Interest

- User and service activity monitoring.
- Unusual IAM behaviour.
- Abnormal API usage.
- Excessive resource access.
- Behaviour baselining.
- Detection engineering.

### Outcome

Develop an understanding of how security teams can progress from individual alerts toward identifying patterns of suspicious activity.

---

## Longer-Term – Secure AI Workloads

### Objective

Apply cloud security principles to AI-based workloads after the core cloud security platform becomes more mature.

### Areas of Interest

- Amazon Bedrock.
- AI threat modelling.
- Secure retrieval-augmented generation architectures.
- Prompt injection defence.
- AI workload logging and monitoring.
- Agent identity and permissions.
- AI access governance.
- Data protection and human oversight.

### Outcome

Explore how identity, secure architecture, visibility, monitoring, access governance and data protection extend into AI systems and autonomous workflows.

---

## Long-Term Goal

Develop practical cloud security engineering capabilities by progressing through:

```text
Secure Infrastructure
         |
         v
Visibility and Logging
         |
         v
Detection and Monitoring
         |
         v
Investigation and Triage
         |
         v
Controlled Response
         |
         v
Security Automation
         |
         v
Behaviour Analytics and AI Security
```

The emphasis throughout the project is on understanding how security controls work together rather than simply deploying AWS services.

Each phase builds on the previous one, allowing the platform to evolve through deliberate architectural decisions, hands-on implementation, operational verification and continuous improvement.