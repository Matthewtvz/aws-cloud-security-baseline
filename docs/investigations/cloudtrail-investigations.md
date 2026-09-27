# CloudTrail Security Investigations

## Overview

The objective of this activity was to understand how AWS CloudTrail records management events and how these logs can be used to investigate activity within an AWS environment.

Rather than deploying new infrastructure, this exercise focused on analysing CloudTrail events, interpreting security evidence, identifying the source of changes, and understanding how cloud security engineers investigate operational activity.

---

# Investigation 1 – AWS Internal KMS Key Deletion

## Objective

Investigate an AWS-managed CloudTrail event and determine what occurred using the available event metadata.

## Evidence

| Field | Value |
|-------|-------|
| Event Name | DeleteKey |
| Event Source | kms.amazonaws.com |
| Region | ap-southeast-2 |
| User Identity | AWS Internal |
| Source IP | AWS Internal |
| Event Type | Management Event |

## Interpretation

CloudTrail recorded a management event involving the deletion of an AWS Key Management Service (KMS) key.

The event was associated with AWS internal service activity rather than a named IAM user or external source IP address. The event modified infrastructure (`readOnly: false`) and referenced the affected KMS key through its ARN.

Based on the available CloudTrail evidence, the activity appeared to originate from an AWS-managed process rather than being directly initiated by a named human user.

## Security Significance

This investigation demonstrates that CloudTrail records AWS-managed service activity in addition to user-initiated actions.

Understanding this distinction is important during security investigations because infrastructure changes must be interpreted in the context of the identity, service, source, and other available event metadata.

## Key Learnings

- CloudTrail records AWS service activity.
- Management events provide visibility into infrastructure changes.
- Identity information helps distinguish AWS-managed operations from user activity.
- Event metadata provides evidence that can support security investigations.

---

# Investigation 2 – AWS Config Delivery Channel Failure

## Objective

Investigate a failed AWS Config API request and determine why the operation was unsuccessful.

## Evidence

| Field | Value |
|-------|-------|
| Event Name | PutDeliveryChannel |
| User | cli-admin |
| Service | AWS Config |
| Tool | Terraform |
| Region | ap-southeast-2 |
| Error Code | InsufficientDeliveryPolicyException |

## Interpretation

CloudTrail recorded an API request initiated by the `cli-admin` IAM user through Terraform to configure an AWS Config delivery channel.

The request failed with an `InsufficientDeliveryPolicyException`, indicating that the destination S3 bucket did not have sufficient permissions for AWS Config to deliver configuration information.

CloudTrail captured both the failed request and its associated error information, providing evidence that could be used to identify the permission issue.

## Security Significance

This investigation demonstrates how CloudTrail can support both security investigation and operational troubleshooting by recording unsuccessful API activity.

It also highlights the importance of service permissions when integrating AWS services and demonstrates how infrastructure deployment failures can generate useful investigative evidence.

## Key Learnings

- CloudTrail records failed API requests.
- The `userAgent` field can help identify the tool used to initiate activity.
- Terraform-generated activity can be distinguished from other forms of AWS interaction.
- API error information can help identify deployment and permission issues.
- Audit logs are useful for both security investigations and infrastructure troubleshooting.

---

# Investigation Outcome

This activity developed practical experience interpreting CloudTrail management events rather than simply enabling logging.

By analysing both AWS-managed activity and user-initiated Terraform activity, I developed a better understanding of how CloudTrail can support:

- Activity attribution
- Infrastructure troubleshooting
- Failed API request analysis
- Security investigations
- Operational visibility

The exercise reinforced the value of establishing logging early so that evidence is available when infrastructure behaves unexpectedly.
