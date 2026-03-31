📊 Performance and Optimization Report

---

📌 Overview

In this project, I tested the performance and reliability of my AWS-based web application to ensure it can handle real-world scenarios like traffic spikes and instance failures.

---

🎯 What I Wanted to Validate

* Can the system handle high traffic?
* Does Auto Scaling work correctly?
* Is the application always available?
* How fast does the system respond?

---

🧪 Testing I Performed

1. Load Testing

I simulated multiple users accessing the application to check how the system behaves under load.

---

2. Auto Scaling Test

* Increased traffic → New instances launched automatically
* Reduced traffic → Extra instances terminated

---

3. Failure Testing

I manually terminated EC2 instances to check if Auto Scaling replaces them.

---

📈 What I Observed

🔹 Load Balancing

The Application Load Balancer distributed traffic evenly across instances.
No single instance was overloaded.

---

🔹 Auto Scaling

Scaling worked as expected:

* Scale-out during high traffic
* Scale-in during low traffic

---

🔹 High Availability

Even when one instance stopped, the application was still accessible.
This confirmed that the multi-AZ setup is working.

---

🔹 Response Time

Response time was stable under normal load.
During scaling events, there was a slight delay, but it recovered quickly.

---

⚡ Optimizations I Used

* EFS for shared storage (no manual sync needed)
* Auto Scaling for efficient resource usage
* Load Balancer for traffic distribution
* Security Groups for controlled access

---

🚧 Challenges I Faced

* EFS mount timeout issue
* Target group showing unhealthy instances
* Security group misconfiguration

---

✅ How I Solved Them

* Allowed NFS traffic (2049) for EFS
* Fixed health check configuration
* Updated security group rules

---

🧠 Key Learnings

* Importance of proper VPC design
* Real working of Auto Scaling
* Debugging AWS networking issues
* Designing scalable architectures

---

🏁 Final Result

The system successfully:

* Handled traffic spikes
* Recovered from failures
* Maintained availability

This project gave me practical experience in building production-like cloud infrastructure.
