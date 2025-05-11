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
<html>
<head>
    <title>Hello World</title>
</head>
<body>
    <h1>Hello, World from RGF DevOps Mentorship!</h1>
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