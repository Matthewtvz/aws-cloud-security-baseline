# AWS Cloud Security Baseline (Terraform)

This project documents my hands-on work building a security-focused AWS environment using Terraform.

The goal is to develop practical cloud security skills by implementing secure AWS foundations, understanding the reasoning behind each control, and applying security by design principles throughout the build process.

---

## Purpose

Cloud security is not just about deploying infrastructure. It is about designing environments that are secure, observable, auditable, and maintainable from the beginning.

This repository serves as the foundation for a broader cloud security journey focused on visibility, security operations, automation, and modern cloud security engineering practices.

---

## What This Project Includes

* IAM configuration and least-privilege access controls
* Terraform-based infrastructure deployment
* CloudTrail logging and audit visibility
* S3 configuration for secure log storage
* Infrastructure modularisation and scalability planning
* Documentation of design decisions and lessons learned

---

## Current Status

### In Progress

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

## Security Approach

This project is not just about deploying infrastructure, but understanding secure design decisions.

Key principles currently being applied:

* Avoiding root account usage and enforcing least privilege
* Enabling logging early (CloudTrail + S3)
* Using Infrastructure as Code for consistency and auditability
* Treating security as part of the build process, not an afterthought
* Building secure foundations before introducing automation

---

## Project Structure

```text
.
├── iam.tf
├── main.tf
├── provider.tf
├── outputs.tf
├── phase-2-network/
└── README.md
```

### Key Components

| File             | Purpose                           |
| ---------------- | --------------------------------- |
| iam.tf           | Identity and access configuration |
| provider.tf      | AWS provider configuration        |
| main.tf          | Core infrastructure deployment    |
| outputs.tf       | Output values                     |
| phase-2-network/ | Network-related configuration     |

---

## Key Takeaways So Far

One of the biggest lessons from this project is that cloud security is rarely about individual tools.

Effective security comes from designing systems where identity, visibility, logging, monitoring, and operational processes work together.

Small decisions made early—such as IAM design, logging configuration, and infrastructure structure—can significantly influence the overall security posture of an environment.

---

## Documentation

Additional project documentation can be found in the `docs/` directory:

* Roadmap
* Architecture
* Lessons Learned
* Security Philosophy

These documents track the project's evolution and future direction as new phases are implemented.

