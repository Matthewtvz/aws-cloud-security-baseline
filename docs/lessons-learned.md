# Lessons Learned

## Lesson 1 – IAM Is the Foundation

One of the first lessons I learned is that cloud security starts with identity.

Before focusing on advanced security tools, it is critical to understand who can access resources, what actions they can perform, and how permissions are controlled.

Least privilege is not simply a best practice—it is a foundational security requirement.

---

## Lesson 2 – Visibility Comes Early

Initially I viewed logging as something that could be added later.

Working with CloudTrail showed me that visibility should be established as early as possible.

Without logging, it becomes difficult to investigate incidents, understand user behaviour, or validate security controls.

Visibility is a prerequisite for security operations.

---

## Lesson 3 – Infrastructure as Code Improves Consistency

Using Terraform highlighted the importance of repeatable infrastructure.

Instead of manually configuring resources, Infrastructure as Code creates environments that are easier to audit, maintain, and reproduce.

This also reduces the risk of configuration drift and helps establish security controls consistently across environments.

---

## Lesson 4 – Security Is a Design Decision

One of the biggest takeaways from this project is that security is not a tool.

Security is the result of decisions made during architecture, deployment, monitoring, and operations.

Small decisions made early can have a significant impact on the overall security posture of an environment.

---

## Lesson 5 – Cloud Security Is an Operational Discipline

Cloud security is not a one-time implementation.

Secure environments require continuous monitoring, validation, improvement, and response.

Building infrastructure is only the beginning. Operating and maintaining secure systems is what creates long-term security outcomes.

---

## Lesson 6 – Foundations Before Automation

A common mistake is focusing on advanced tooling before understanding fundamentals.

This project reinforced the importance of building strong foundations first through IAM, logging, monitoring, and Infrastructure as Code.

Automation becomes significantly more effective when the underlying security controls are already well designed.

---

## Key Takeaway

The most important lesson so far is that cloud security is not about deploying as many security tools as possible.

Effective cloud security comes from understanding systems, creating visibility, controlling access, and continuously improving security over time.

Strong foundations make every future security capability more effective.
