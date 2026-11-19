
# AWS Auto-Healing Architecture

## Architecture Components

1. Internet Users
2. Application Load Balancer
3. Target Group
4. EC2 Instances
5. Auto Scaling Group
6. Amazon CloudWatch
7. Amazon SNS

## Traffic Flow

Internet Users
      |
      v
Application Load Balancer
      |
      v
Target Group
      |
      v
EC2 Instances

## Monitoring Flow

EC2 Status Check
      |
      v
Amazon CloudWatch
      |
      v
CloudWatch Alarm
      |
      v
Amazon SNS
      |
      v
Email Notification

## Automatic Recovery

When an EC2 instance is terminated,
the Auto Scaling Group launches a
replacement instance to maintain
the desired capacity.
