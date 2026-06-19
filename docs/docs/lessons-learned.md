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

---

## Lesson 3 – Infrastructure as Code Improves Consistency

Using Terraform highlighted the importance of repeatable infrastructure.

Instead of manually configuring resources, Infrastructure as Code creates environments that are easier to audit, maintain, and reproduce.

This also reduces the risk of configuration drift.

---

## Lesson 4 – Security Is a Design Decision

One of the biggest takeaways from this project is that security is not a tool.

Security is the result of decisions made during architecture, deployment, monitoring, and operations.

Small decisions made early can have a significant impact on the overall security posture of an environment.

---

## Lesson 5 – Cloud Security Is an Operational Discipline

Cloud security is not a one-time implementation.

Secure environments require continuous monitoring, validation, improvement, and response.

This project has shifted my thinking from deploying infrastructure to operating secure systems.
