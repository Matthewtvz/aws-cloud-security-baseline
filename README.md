# AWS Cloud Security Baseline (Terraform)

This project documents my hands-on work building a cloud security baseline in AWS using Terraform.

## Purpose

The goal of this project is to develop practical cloud security skills by implementing secure AWS foundations and understanding the reasoning behind each control.

## What this project includes

- IAM configuration (non-root access practices)
- Terraform-based infrastructure deployment
- Logging setup (CloudTrail)
- S3 configuration for secure log storage
- Incremental phase-based development

## Project structure

- `iam.tf` → Identity and access configuration
- `provider.tf` → AWS provider setup
- `main.tf` → Core infrastructure configuration
- `outputs.tf` → Output values
- `phase-2-network/` → Network-related configuration (in progress)

## Current status

In progress — currently working through infrastructure setup and logging configuration while refining Terraform structure and fixing deployment issues.

## What I’m learning

- AWS security fundamentals
- Infrastructure as Code (Terraform)
- Cloud logging and monitoring
- Debugging and fixing real configuration errors
- Security-focused system thinking

## Next steps

- Clean up file structure
- Finalise CloudTrail + S3 logging
- Improve modular Terraform design
- Add documentation for each phase

- ## Security approach

This project is not just about deploying infrastructure, but understanding secure design decisions.

Key principles I am applying:
- Avoiding root account usage and enforcing least privilege
- Ensuring logging is enabled early (CloudTrail + S3)
- Structuring infrastructure using Terraform for consistency and auditability
- Thinking about security controls as part of the build process, not after

## Key takeaway so far

One of the biggest things I’ve realised is that cloud security is not just about tools, but about how you structure and control access from the beginning. Small decisions early (like IAM and logging) have a big impact on overall security posture.
