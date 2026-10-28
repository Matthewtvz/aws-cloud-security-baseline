# Lessons Learned

This document captures the technical and architectural lessons developed while building the AWS Cloud Security Baseline using Terraform.

The project has reinforced that cloud security engineering involves more than deploying infrastructure. It requires understanding dependencies, investigating failures, validating security controls and maintaining reliable configurations.

---

## Lesson 1 – IAM Is the Foundation

One of the first lessons I learned is that cloud security starts with identity.

Before focusing on advanced security tools, it is important to understand who can access resources, what actions they can perform and how permissions are controlled.

Working with IAM account controls and AWS service roles reinforced the importance of carefully designing permissions and progressing toward least privilege.

During Phase 3, I also learned that AWS permissions operate across multiple layers. An IAM role may allow an action, but a resource policy or KMS key policy can still prevent the operation.

**Key takeaway:** Secure service integrations require understanding how identity-based and resource-based permissions interact.

---

## Lesson 2 – Visibility Must Come Early

Initially, I viewed logging as something that could be added after infrastructure deployment.

Working with CloudTrail changed that perspective.

CloudTrail allowed me to investigate AWS API activity, distinguish between named user and AWS-managed service activity, identify the tools involved in operations and analyse failed API requests.

During the AWS Config deployment, CloudTrail provided evidence of a failed `PutDeliveryChannel` operation and its associated error.

Without this visibility, troubleshooting would have been more difficult.

**Key takeaway:** Logging should be established early because reliable evidence is essential for investigation, troubleshooting and security operations.

---

## Lesson 3 – Infrastructure as Code Requires State Management

Using Terraform demonstrated the value of defining infrastructure through repeatable and version-controlled configuration.

Terraform makes it easier to review resources, manage dependencies and maintain consistency across deployments.

However, Phase 3 also exposed an important operational challenge: Terraform configuration and Terraform state must remain consistent with the actual AWS environment.

When existing resources were not correctly represented in local state, I had to inspect the deployed environment, reconcile the configuration and import existing resources where appropriate.

This demonstrated why blindly recreating resources or resetting state can introduce unnecessary risk.

**Key takeaway:** Infrastructure as Code requires disciplined state management, not just correct configuration files.

---

## Lesson 4 – Network Architecture Is Part of Security

Building a custom VPC with separate public and private subnets demonstrated how security decisions are embedded in infrastructure design.

The public subnet has a route through an Internet Gateway, while the private subnet does not have a direct internet route.

This creates different network connectivity boundaries that can support future workload segmentation.

I also learned that a subnet being public does not automatically mean every resource within it is publicly accessible. Resource configuration and network security controls remain important.

**Key takeaway:** Secure network design begins with deliberate connectivity and isolation decisions.

---

## Lesson 5 – Encryption Must Be Verified, Not Assumed

Implementing centralised S3 logging and AWS KMS encryption showed me that protecting security data involves several interacting controls.

S3 Block Public Access, versioning, bucket policies, KMS key policies and encryption settings all contribute to the design.

One important Phase 3 lesson came from inspecting CloudTrail log objects.

An earlier object reported `AES256` encryption, even though the CloudTrail configuration subsequently referenced the customer-managed KMS key.

Rather than assuming the configuration was working, I inspected a newer delivered object.

Its metadata confirmed `aws:kms` encryption and the intended customer-managed key.

**Key takeaway:** A configured security control is not equivalent to a verified security outcome. Actual resource behaviour provides stronger evidence.

---

## Lesson 6 – Failed Deployments Are Useful Security Evidence

One of the most valuable lessons came from an AWS Config delivery channel failure.

CloudTrail recorded the failed `PutDeliveryChannel` API request and exposed the `InsufficientDeliveryPolicyException` error.

This helped identify the S3 delivery permissions as an area requiring investigation.

The issue reinforced that AWS service integrations depend on correct permissions across IAM, S3 and, where applicable, KMS.

After correcting the relevant configuration, I verified the AWS Config recorder and successfully requested a configuration snapshot.

**Key takeaway:** Deployment failures should be investigated systematically using error messages, audit records and service configuration rather than bypassed through unnecessarily broad permissions.

---

## Lesson 7 – Successful Deployment Is Not Successful Operation

Terraform successfully creating resources does not guarantee that the services are performing their intended functions.

During Phase 3, I used AWS CLI commands to verify CloudTrail logging status, inspect S3 objects, confirm KMS encryption and check AWS Config recording.

I also learned to distinguish between different levels of verification.

For example, AWS Config creating a `ConfigWritabilityCheckFile` demonstrated a storage access check, but it did not prove that a configuration snapshot had been delivered.

An explicit snapshot request followed by a `SUCCESS` delivery status provided stronger evidence.

Ongoing AWS Config configuration history delivery remains a separate verification item.

**Key takeaway:** Operational verification should be based on observable evidence, with unverified behaviour clearly identified.

---

## Lesson 8 – Cloud Security Is an Operational Discipline

Cloud security is not a one-time implementation.

Secure environments require ongoing monitoring, investigation, validation, maintenance and improvement.

The Phase 3 deployment demonstrated this through Terraform state recovery, service permission troubleshooting, log delivery verification and configuration checks.

It also highlighted the importance of maintaining clear documentation so that future investigations can build on previous findings.

**Key takeaway:** Building infrastructure is only the beginning. Understanding and maintaining its operational behaviour is equally important.

---

## Lesson 9 – Foundations Before Automation

This project reinforced the importance of understanding foundational controls before introducing extensive automation.

Identity, networking, logging, configuration visibility, encryption and investigation provide the foundation for future detection and automated response capabilities.

Without reliable visibility, automation could respond to incomplete information. Without clear permissions, automated workflows could introduce additional security risks.

Future automation should therefore be built around controlled access, reliable evidence, explicit decision rules and auditable actions.

**Key takeaway:** Automation is most valuable when the underlying infrastructure, security controls and operational processes are understood and verified.

---

## Additional Engineering Lesson – Version Control and Change Management

During the Phase 3 deployment, the Terraform configuration was committed locally, but the initial GitHub push was rejected because the remote repository contained newer documentation commits.

Instead of overwriting the remote branch, I fetched the latest changes, rebased my local commit and pushed successfully.

This preserved both the infrastructure changes and the existing documentation history.

The experience demonstrated the importance of understanding Git history, resolving synchronization issues safely and avoiding destructive operations such as unnecessary force pushes.

**Key takeaway:** Version control is part of reliable infrastructure engineering, particularly when infrastructure and documentation evolve independently.

---

## Key Takeaway

The most important lesson from this project is that cloud security is not about deploying as many security services as possible.

Effective cloud security engineering requires understanding how systems interact, controlling access, designing secure infrastructure, establishing visibility and verifying actual behaviour.

Phase 3 strengthened my understanding of the difference between configuring a control and proving that it works.

The project also demonstrated the value of treating failures as engineering investigations rather than obstacles to bypass.

As the platform evolves toward detection, investigation, response and automation, these foundational lessons will guide future architectural decisions.