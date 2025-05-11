📘 Hello World Web App on Amazon Linux

This guide helps you install Apache (httpd) and deploy a simple "Hello, World" web page using Amazon Linux.

🧾 Prerequisites

An Amazon EC2 instance running Amazon Linux

SSH access to the instance

Port 80 (HTTP) opened in the Security Group

🚀 Setup Instructions

Connect to your EC2 instance via SSH:
```sh
ssh ec2-user@<your-ec2-public-ip>
```

Download or create the script on your EC2 instance:
```sh
vi setup_hello_world.sh
```sh

Then paste the contents of the script into the file and save it (Shift zz, OR wq! to save and exit).

Make the script executable:
```sh
chmod +x setup_hello_world.sh
```

Run the script:
```sh
./setup_hello_world.sh
```

Access the web app:

Open your browser and visit:

http://<your-ec2-public-ip>/

You should see:

Hello, World from RGF DevOps Mentorship!
📎 Notes
If you're using a custom firewall, ensure port 80 is allowed.
This setup uses Apache (httpd) to serve a static HTML file.
