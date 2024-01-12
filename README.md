# Project Title

Brief description of your project.

## Table of Contents

- [Overview](#overview)
- [Getting Started](#getting-started)
- [GitHub Actions](#github-actions)
- [Security](#security)

## Overview

This project automates the deployment of a basic AWS infrastructure using Terraform. It includes the creation of a VPC with subnets, provisioning an EC2 instance running Nginx, and setting up a GitHub Actions pipeline for automated deployment.

### Tasks Completed

1. **VPC and Subnets**:
   - Created a VPC with CIDR block `10.0.0.0/16`.
   - Configured two public and two private subnets.

2. **EC2 Instance**:
   - Provisioned a `t2.micro` EC2 instance with a chosen Amazon Linux 2 AMI.
   - Configured security groups to allow traffic on ports 22 and 80.
   - Associated the EC2 instance with an existing or newly created SSH key pair.

3. **Nginx Configuration**:
   - Installed and configured Nginx on the EC2 instance.
   - Ensured Nginx starts automatically on boot.

4. **Security Group Rules**:
   - Modified security groups to allow incoming traffic on port 80 from `0.0.0.0/0`.

5. **GitHub Actions Pipeline**:
   - Automated Terraform deployment on GitHub Actions.
   - Triggered on pushes to the repository.
   - Utilized GitHub Secrets for AWS authentication.
   - Executed `terraform init`, `terraform plan`, and `terraform apply`.
   - Included error handling and notifications.

## Getting Started

1. Clone this repository to your local machine.
2. Use command "aws configure" to configure the project with your AWS credentials.
3. Commit changes and push to your GitHub repository.
4. GitHub Actions will automatically deploy the infrastructure.

## GitHub Actions

The `.github/workflows/deploy.yml` file contains the pipeline for automated deployment.

## Security

Ensure that sensitive information like AWS credentials is stored securely using GitHub Secrets.

