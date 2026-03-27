# 🚀 Resilient and Scalable Web Application Deployment on AWS

## 📌 Project Overview
This project demonstrates the deployment of a highly available, scalable, and resilient web application using AWS cloud infrastructure.

The architecture is designed to ensure:
- High availability across multiple Availability Zones
- Automatic scaling based on traffic demand
- Secure and fault-tolerant communication

---

## 🎯 Objectives
- High Availability using Multi-AZ deployment
- Scalability using Auto Scaling Groups
- Security using controlled network access
- Resilience through automated recovery

---

## 🧰 AWS Services Used
- VPC (Virtual Private Cloud)
- EC2 (Elastic Compute Cloud)
- EFS (Elastic File System)
- Auto Scaling Group
- Application Load Balancer (ALB)
- Route 53

---

## 🏗️ Architecture
(Add your architecture diagram here)

---

## ⚙️ Implementation

### 1. Networking
- Created VPC with public and private subnets
- Configured Internet Gateway and NAT Gateway
- Set up Route Tables

### 2. Storage
- Configured EFS for shared storage across instances

### 3. Compute
- Launched EC2 instances in private subnets
- Installed Apache Web Server
- Mounted EFS

### 4. Scaling & Load Balancing
- Created Launch Template
- Configured Auto Scaling Group
- Attached Application Load Balancer

### 5. Domain Setup
- Integrated domain using Route 53

---

## 🔐 Security
- ALB allows HTTP from internet
- EC2 allows traffic only from ALB
- EFS allows traffic only from EC2

---

## 🧪 Testing
- Verified Auto Scaling functionality
- Simulated high traffic load
- Tested fault tolerance

---

## 📊 Results
- High availability achieved
- Load distributed efficiently
- Automatic scaling worked successfully

---

## 📸 Screenshots
(Add screenshots here)

---

## 💡 Key Learnings
- AWS networking (VPC, subnets)
- Load balancing and scaling
- Cloud architecture design

---

## 👨‍💻 Author
Ashwin Vishwakarma
