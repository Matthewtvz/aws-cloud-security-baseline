# Cloud Security Operations Platform Architecture

## Overview

This project began as an AWS Cloud Security Baseline built with Terraform.

The current architecture focuses on establishing secure foundations across identity, networking, logging, encryption, and configuration visibility.

The long-term direction is to progressively extend these foundations into detection, investigation, response, and security automation.

---

# Current Architecture

```text
                         AWS Account
                             |
              +--------------+--------------+
              |              |              |
              v              v              v
             IAM            VPC        Visibility
              |              |              |
       Account Controls      |       +------+------+
                             |       |             |
                       +-----+-----+ v             v
                       |           | CloudTrail  AWS Config
                    Public      Private    |          |
                    Subnet      Subnet     +----+-----+
                       |                       |
                Internet Gateway              v
                                         S3 Log Storage
                                               |
                                               v
                                         KMS Encryption
