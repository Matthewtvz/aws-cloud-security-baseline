# Cloud Security Operations Platform Architecture

## Current Architecture (Phase 1)

Terraform
↓
AWS Account
↓
├── IAM
├── S3
└── CloudTrail

### Purpose

The current architecture focuses on establishing secure cloud foundations through identity management, infrastructure as code, and audit logging.

Key objectives:

* Least privilege access
* Infrastructure consistency
* Audit visibility
* Secure log storage

---

## Future Architecture

### Phase 2 – Visibility & Monitoring

CloudTrail
↓
CloudWatch
↓
AWS Config
↓
GuardDuty

Goal:

Create visibility across the environment and identify security-relevant events.

---

### Phase 3 – Behaviour Analytics

User Activity
↓
Risk Scoring
↓
Behaviour Analysis
↓
Investigation

Goal:

Move beyond individual alerts and identify patterns of risk.

---

### Phase 4 – Security Automation

CloudTrail
↓
EventBridge
↓
Lambda
↓
SNS

Goal:

Automate repetitive security tasks and improve response times.

---

### Phase 5 – Secure AI Workloads

User
↓
AWS Bedrock
↓
Knowledge Base
↓
Secure Data Storage

Goal:

Apply cloud security principles to modern AI environments.

---

## Architectural Principles

The platform is designed around five principles:

1. Visibility
2. Behaviour Analytics
3. Security by Design
4. Automation
5. Continuous Improvement

These principles guide the evolution of the project from foundational AWS security controls to modern cloud security operations and AI security.

