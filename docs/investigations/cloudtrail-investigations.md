# Phase 2 – CloudTrail Investigations

## Overview

The objective of this activity was to understand how AWS CloudTrail records management events and how these logs can be used to investigate changes within an AWS environment.

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

CloudTrail recorded a management event in which an AWS Key Management Service (KMS) key was deleted. The event was initiated by an AWS internal service rather than a named IAM user or external IP address.

The event modified infrastructure (`readOnly: false`) and affected a specific KMS key identified by its ARN.

Based on the available evidence, there is no indication that the action was initiated directly by a human user.

## Security Significance

This investigation demonstrates that CloudTrail records AWS-managed service events in addition to user-initiated actions. Understanding the difference is important during incident investigations because not every infrastructure change represents malicious activity.

## Key Learnings

- CloudTrail records AWS service events.
- Management events provide visibility into infrastructure changes.
- User identity information helps distinguish AWS-managed operations from user activity.
- CloudTrail provides evidence that supports security investigations.

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

The request failed because the destination S3 bucket did not contain the required delivery policy allowing AWS Config to write configuration snapshots.

CloudTrail captured both the failed request and the associated error, allowing the root cause of the issue to be identified.

## Security Significance

This investigation demonstrates how CloudTrail supports operational troubleshooting and security investigations by recording failed API calls.

It also highlights the importance of correctly configuring resource permissions when integrating AWS services.

## Key Learnings

- CloudTrail records failed API calls.
- The `userAgent` field identifies the tool used to perform an action.
- Terraform activity can be distinguished from AWS Console activity.
- Error messages often identify the root cause of deployment failures.

---

# Phase Outcome

This activity developed practical experience interpreting CloudTrail management events rather than simply enabling AWS services.

By analysing both AWS-managed and user-initiated events, I gained an understanding of how CloudTrail supports operational visibility, forensic investigation, and troubleshooting within AWS environments.
