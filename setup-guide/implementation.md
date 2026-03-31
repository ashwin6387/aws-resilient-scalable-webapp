⚙️ Implementation Guide

Resilient and Scalable Web Application Deployment on AWS

---

📌 Overview

In this project, I designed and deployed a highly available and scalable web application on AWS.
The goal was to build a system that can handle traffic automatically, remain available during failures, and follow secure architecture practices.

---

🏗️ Step 1: VPC and Networking Setup

1. Create VPC

I started by creating a VPC with a CIDR block (e.g., `10.0.0.0/16`) to isolate my infrastructure.

---

2. Create Subnets

I created four subnets across two Availability Zones:

* **Public Subnets** (for Load Balancer & NAT Gateway)
* **Private Subnets** (for EC2 instances)

This setup helped me achieve high availability.

---
3. Internet Gateway

I created and attached an Internet Gateway to allow internet access for public resources.

---

4. Route Tables

* Public subnets were connected to the Internet Gateway
* Private subnets were configured to use NAT Gateway for outbound traffic

---
5. NAT Gateway

I created a NAT Gateway in a public subnet so that private instances could access the internet securely (for updates, package installs, etc.).

---

💾 Step 2: EFS Setup

To avoid manually copying files to each EC2 instance, I used EFS as shared storage.

What I did:

* Created an EFS file system
* Attached it to private subnets
* Configured a security group allowing NFS (2049)

👉 This allowed all EC2 instances to access the same application files.

---

🖥️ Step 3: EC2 Setup

1. Launch Instance

I launched an EC2 instance (Amazon Linux) to configure the application.

---

2. Install Web Server

```bash
sudo yum update -y
sudo yum install -y httpd amazon-efs-utils
```

---

3. Start Apache

```bash
sudo systemctl start httpd
sudo systemctl enable httpd
```

---

4. Mount EFS

I mounted EFS to the web directory:

```bash
sudo mount -t efs -o tls fs-xxxx:/ /var/www/html/
```

---

5. Create Web Page

I created a simple `index.html` to verify deployment.

---

6. Permanent Mount

Configured `/etc/fstab` to ensure EFS mounts automatically on reboot.

---

⚠️ Issue I Faced

Initially, I faced an **EFS mount timeout issue**.
After troubleshooting, I found that the security group was not allowing NFS traffic.

✅ I fixed it by allowing port **2049** between EC2 and EFS.

---

7. Create AMI

After setup, I created an AMI which was later used in Auto Scaling.

---

🔄 Step 4: Auto Scaling Setup

What I did:

* Created a Launch Template using the AMI
* Created an Auto Scaling Group across private subnets
* Configured min, max, and desired capacity

👉 This ensured the application scales automatically based on traffic.

---

⚖️ Step 5: Load Balancer Setup

1. Target Groups

* Web App → Port 80
* Test App → Port 8080

---

2. Application Load Balancer

I created an ALB in public subnets to distribute incoming traffic across instances.

---

⚠️ Issue I Faced

At one point, my target group showed **unhealthy instances**.

✅ I fixed it by:

* Correcting health check path
* Ensuring the application was running on the correct port

---

🔐 Step 6: Security Configuration

I followed the principle of least privilege:

* ALB → Open to internet (Port 80)
* EC2 → Only accessible from ALB
* EFS → Only accessible from EC2

---

🌐 Step 7: Domain Setup

I connected my domain using Route 53:

* Created hosted zone
* Updated nameservers in GoDaddy
* Mapped domain to ALB

---

🧪 Step 8: Testing

What I tested:

* Terminated EC2 → Auto Scaling launched new instance ✅
* Simulated traffic → Load balanced across instances ✅
* Stopped one instance → App still accessible ✅

---

✅ Conclusion

Through this project, I was able to build a real-world AWS architecture that is:

* Highly available
* Scalable
* Secure
* Fault-tolerant

This gave me strong hands-on experience with AWS and DevOps concepts.
