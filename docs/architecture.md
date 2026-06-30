# Cloud Security Operations Platform Architecture

## Current Architecture (Phase 1)

```text
Terraform
    │
    ▼
AWS Account
    │
    ├── IAM
    ├── S3
    └── CloudTrail
```

### Purpose

The current architecture focuses on establishing secure cloud foundations through identity management, infrastructure as code, and audit logging.

Key objectives:

- Least privilege access
- Infrastructure consistency
- Audit visibility
- Secure log storage

---

## Future Architecture

### Phase 2 – Visibility & Monitoring

```text
CloudTrail
    │
    ▼
CloudWatch
    │
    ▼
AWS Config
    │
    ▼
GuardDuty
```

#### Goal

Create visibility across the environment and identify security-relevant events.

This phase focuses on understanding:

- What resources exist
- What changes occur
- Who performed actions
- Which events require investigation

---

### Phase 3 – Behaviour Analytics

```text
User Activity
    │
    ▼
Risk Scoring
    │
    ▼
Behaviour Analysis
    │
    ▼
Investigation
```

#### Goal

Move beyond individual alerts and identify patterns of risk.

This phase focuses on:

- User behaviour monitoring
- Anomaly detection
- Privilege abuse identification
- Security investigations

---

### Phase 4 – Security Automation

```text
CloudTrail
    │
    ▼
EventBridge
    │
    ▼
Lambda
    │
    ▼
SNS
```

#### Goal

Automate repetitive security tasks and improve response times.

Potential automations include:

- Root login alerts
- Public S3 bucket detection
- Security group misconfiguration alerts
- IAM policy change notifications

---

### Phase 5 – Secure AI Workloads

```text
User
    │
    ▼
AWS Bedrock
    │
    ▼
Knowledge Base
    │
    ▼
Secure Data Storage
```

#### Goal

Apply cloud security principles to modern AI environments.

Focus areas include:

- AI threat modelling
- Secure retrieval-augmented generation (RAG)
- Prompt injection defence
- AI logging and monitoring
- Data protection and governance

---

## Architectural Principles

The platform is designed around five core principles:

1. Visibility
2. Behaviour Analytics
3. Security by Design
4. Automation
5. Continuous Improvement

These principles guide the evolution of the project from foundational AWS security controls to modern cloud security operations and AI security.

---

## Long-Term Vision

This project began as an AWS Cloud Security Baseline built with Terraform.

The long-term vision is to evolve it into a Cloud Security Operations Platform that demonstrates how cloud security matures from foundational controls to monitoring, analytics, automation, and AI security.

The objective is not simply to deploy cloud infrastructure, but to understand how security capabilities evolve as environments become larger, more complex, and increasingly AI-driven.
