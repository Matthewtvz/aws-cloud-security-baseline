# AWS Cloud Security Baseline (Terraform)

This project documents my hands-on work building a security-focused AWS environment using Terraform. The repository serves as the foundation of a larger Cloud Security Operations Platform inspired by modern cloud security engineering practices and the evolution of cloud-native security operations.

The objective is not only to deploy infrastructure, but to understand how secure cloud environments are designed, monitored, and continuously improved.

---

## Vision

This repository represents Phase 1 of a long-term Cloud Security Operations Platform.

The platform is being developed around five core principles:

1. Visibility
2. Behaviour Analytics
3. Security by Design
4. Automation
5. Continuous Improvement

The goal is to progressively move from secure cloud foundations toward cloud security operations, automated response, and eventually secure AI workloads.

---

## Purpose

The goal of this project is to develop practical cloud security skills by implementing secure AWS foundations and understanding the reasoning behind each security control.

Rather than focusing solely on deployment, this project explores how cloud security teams establish visibility, reduce risk, and build systems that remain secure as environments grow.

---

## What This Project Includes

* IAM configuration and least-privilege access controls
* Terraform-based infrastructure deployment
* CloudTrail logging and audit visibility
* S3 configuration for secure log storage
* Infrastructure modularisation and scalability planning
* Documentation of design decisions and lessons learned

---

## Security Philosophy

This project is heavily influenced by modern cloud security operations practices.

Several principles guide every implementation decision:

### Visibility First

You cannot secure what you cannot see.

Logging, monitoring, and auditability are established early so that security decisions can be based on evidence rather than assumptions.

### Security by Design

Security should be built into infrastructure from the beginning, not added after deployment.

### Behaviour Over Events

Individual events often provide little context. Meaningful security insights emerge when behaviour is observed over time.

### Automation Where Appropriate

Repetitive security tasks should be automated, allowing humans to focus on analysis, decision-making, and continuous improvement.

### Continuous Improvement

Cloud security is not a destination. Security controls, monitoring capabilities, and operational processes must evolve alongside the environment.

---

## Current Status

### Phase 1 – Cloud Security Foundations (In Progress)

Current areas of focus:

* IAM hardening
* Least privilege access
* Terraform fundamentals
* CloudTrail logging
* Secure S3 log storage
* Infrastructure structure and modularisation

Key skills being developed:

* AWS security fundamentals
* Infrastructure as Code (Terraform)
* Cloud logging and monitoring
* Debugging and resolving configuration issues
* Security-focused systems thinking

---

## Roadmap

### Phase 1 – Cloud Security Foundations

* [x] IAM Configuration
* [x] Terraform Deployment
* [x] CloudTrail Logging
* [ ] Modular Terraform Structure
* [ ] Security Documentation Expansion

### Phase 2 – Visibility & Monitoring

* [ ] AWS Config
* [ ] CloudWatch Monitoring
* [ ] GuardDuty
* [ ] Security Dashboards
* [ ] Resource Discovery

### Phase 3 – Behaviour Analytics

* [ ] User Activity Monitoring
* [ ] Risk Scoring Framework
* [ ] Security Analytics
* [ ] Detection Logic

### Phase 4 – Security Playbooks

* [ ] Incident Response Procedures
* [ ] Root Login Investigation Playbook
* [ ] Public S3 Exposure Playbook
* [ ] IAM Privilege Escalation Playbook

### Phase 5 – Security Automation

* [ ] EventBridge Integration
* [ ] Lambda-Based Responses
* [ ] SNS Alerting
* [ ] Automated Remediation Workflows

### Phase 6 – Secure AI Workloads

* [ ] AWS Bedrock Security
* [ ] Secure RAG Architecture
* [ ] Prompt Logging
* [ ] AI Threat Modelling
* [ ] AI Security Guardrails

---

## Key Takeaways So Far

One of the most important lessons from this project is that cloud security is rarely about individual tools.

Effective security comes from designing systems where identity, visibility, logging, monitoring, and operational processes work together.

Small decisions made early—such as IAM design, logging configuration, and infrastructure structure—can significantly influence the overall security posture of an environment.

This project is an ongoing exploration of those principles through practical implementation and continuous iteration.
