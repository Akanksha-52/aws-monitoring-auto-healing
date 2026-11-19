
# AWS Monitoring and Auto-Healing Infrastructure

## 1. Project Overview

This project demonstrates an AWS-based monitoring and auto-healing infrastructure designed to improve website availability and reduce manual server management.

The website is hosted on Amazon EC2 instances. An Application Load Balancer distributes incoming traffic, while an Auto Scaling Group maintains the desired number of instances.

Amazon CloudWatch monitors EC2 status-check failures and Amazon SNS sends email notifications when an alarm is triggered.

## 2. Project Objectives

- Host a website on AWS EC2.
- Distribute incoming traffic using an Application Load Balancer.
- Monitor EC2 health using Amazon CloudWatch.
- Receive email alerts using Amazon SNS.
- Automatically replace terminated EC2 instances using Auto Scaling.
- Improve website availability and infrastructure reliability.

## 3. AWS Services Used

| AWS Service | Purpose |
|---|---|
| Amazon EC2 | Hosts website servers |
| Launch Template | Defines EC2 instance configuration |
| Auto Scaling Group | Maintains desired instance capacity |
| Application Load Balancer | Distributes incoming traffic |
| Target Group | Registers instances and performs health checks |
| Amazon CloudWatch | Monitors EC2 status-check metrics |
| Amazon SNS | Sends email notifications |
| IAM Role | Provides EC2 permissions |
| Security Groups | Controls network traffic |

## 4. Project Architecture

1. Users access the website through the Application Load Balancer.
2. The ALB forwards requests to the registered EC2 instances.
3. The Target Group performs HTTP health checks.
4. The Auto Scaling Group maintains two EC2 instances.
5. CloudWatch monitors the EC2 StatusCheckFailed metric.
6. When the alarm enters the ALARM state, SNS sends an email notification.
7. If an EC2 instance is terminated, Auto Scaling launches a replacement to maintain the desired capacity.

## 5. Implementation Steps

### Step 1: Create SNS Topic

- Created an SNS topic named `ec2-health-alerts`.
- Subscribed an email address.
- Confirmed the email subscription.

### Step 2: Create EC2 Launch Template

- Created a launch template named `auto-healing-template`.
- Selected Amazon Linux 2023.
- Selected instance type `t3.micro`.
- Attached the `EC2-SSM-Role` IAM role.
- Configured Apache installation using User Data.

### Step 3: Create Target Group

- Created `web-target-group`.
- Selected Instances as the target type.
- Configured HTTP on port 80.
- Set the health check path to `/`.

### Step 4: Create Application Load Balancer

- Created `web-app-alb`.
- Configured an HTTP listener on port 80.
- Forwarded requests to `web-target-group`.

### Step 5: Configure Security Groups

- Allowed incoming HTTP traffic from the internet to the ALB.
- Allowed HTTP traffic from the ALB security group to the EC2 security group.

### Step 6: Create Auto Scaling Group

- Created `web-auto-scaling-group`.
- Attached the launch template.
- Connected the target group.
- Configured desired capacity to 2 instances.

### Step 7: Configure CloudWatch Alarm

- Selected the EC2 `StatusCheckFailed` metric.
- Configured the threshold as greater than or equal to 1.
- Connected the alarm to the SNS notification topic.

### Step 8: Test Auto-Healing

- Terminated one EC2 instance belonging to the Auto Scaling Group.
- Verified that Auto Scaling launched a replacement instance.
- Checked the CloudWatch alarm and SNS email notification separately.

## 6. User Data Script

The following script installs and starts Apache and creates a sample website.

```bash
#!/bin/bash

dnf install -y httpd

systemctl enable --now httpd

echo "<h1>AWS Auto-Healing Project</h1>" > /var/www/html/index.html
```

## 7. Screenshots

Add screenshots of your actual AWS implementation here:

- SNS Topic and email subscription
- EC2 Launch Template
- Target Group
- Application Load Balancer
- Auto Scaling Group
- CloudWatch Alarm
- Auto-Healing test

## 8. Project Outcome

Successfully configured an AWS monitoring and auto-healing infrastructure using EC2, Application Load Balancer, Auto Scaling, CloudWatch and SNS.

The project demonstrates practical knowledge of AWS infrastructure management, monitoring, automated recovery and cloud reliability.

## 9. Skills Demonstrated

- AWS Cloud Infrastructure
- EC2 Management
- Load Balancing
- Auto Scaling
- CloudWatch Monitoring
- SNS Notifications
- IAM and Security Groups
- Linux and Apache Administration

## 10. Author
Akanksha Pathak

Your Name

**Project Category:** AWS Cloud / DevOps
