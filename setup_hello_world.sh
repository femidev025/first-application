#!/bin/bash

# Update system packages
sudo yum update -y

# Install Apache HTTP Server
sudo yum install -y httpd

# Enable and start the httpd service
sudo systemctl enable httpd
sudo systemctl start httpd

# Create a simple Hello World HTML page
cat <<EOF | sudo tee /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome | RGF DevOps Mentorship</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #667eea, #764ba2);
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }
        .container {
            background: rgba(0, 0, 0, 0.4);
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.3);
        }
        h1 {
            font-size: 3em;
            margin-bottom: 10px;
        }
        p {
            font-size: 1.2em;
        }
        .footer {
            margin-top: 30px;
            font-size: 0.9em;
            color: #ccc;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🚀 Hello, World!</h1>
        <p>Welcome to the <strong>RGF DevOps Mentorship</strong> application running on Amazon Linux.</p>
        <div class="footer">Powered by Apache on EC2</div>
    </div>
</body>
</html>
EOF

# Adjust firewall (if running firewalld)
if systemctl is-active --quiet firewalld; then
    sudo firewall-cmd --permanent --add-service=http
    sudo firewall-cmd --reload
fi

# Get the public IP
PUBLIC_IP=$(curl ifconfig.me)

# Display success message with access URL
echo ""
echo "✅ Deployment complete!"
echo "🌐 Access your app at: http://$PUBLIC_IP/"