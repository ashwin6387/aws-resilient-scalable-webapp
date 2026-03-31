!/bin/bash

# 🚀 Update system

yum update -y

# 📦 Install required packages

yum install -y httpd amazon-efs-utils

# ▶️ Start and enable Apache

systemctl start httpd
systemctl enable httpd

# 📁 Create web root directory (if not exists)

mkdir -p /var/www/html

# 🔗 Mount EFS (Replace with your EFS File System ID & Region)

EFS_ID="fs-0c698200184af5456"
REGION="eu-north-1"

mount -t efs -o tls ${fs-0c698200184af5456}:/ /var/www/html

# ⏳ Wait to ensure mount is successful

sleep 5

# 📝 Create a sample index page (dynamic instance info)

INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

cat <<EOF > /var/www/html/index.html

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to CloudFolks Capstone Project 1</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f0f4f8;
            font-family: 'Arial', sans-serif;
        }

        .container {
            text-align: center;
            padding: 20px;
            border-radius: 10px;
            background-color: #004f5d; /* Dark Teal Background */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #ffffff; /* White Text Color */
            font-size: 2em;
        }

        p {
            color: #ffffff; /* Consistent Text Color */
            font-size: 1.2em;
        }

        strong {
            color: #ef7f1a; /* Updated CloudFolks Hub Color to Vibrant Orange */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to CloudFolks Capstone Project 1</h1>
        <p>Powered by <strong>CloudFolks Hub</strong></p>
    </div>
</body>
</html>
EOF

# 🔁 Persist EFS Mount (on reboot)

echo "fs-0c698200184af5456.efs.eu-north-1.amazonaws.com:/ /var/www/html/ efs defaults,_netdev 0 0" >> /etc/fstab

# 🔄 Restart Apache to ensure everything is working

systemctl restart httpd

# ✅ Done

echo "User data script executed successfully!"
