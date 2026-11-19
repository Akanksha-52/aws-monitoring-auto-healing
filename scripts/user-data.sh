
#!/bin/bash

# Install Apache
dnf install -y httpd

# Enable Apache service
systemctl enable --now httpd

# Create website
cat > /var/www/html/index.html <<'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>AWS Auto-Healing Project</title>
</head>
<body>
    <h1>AWS Monitoring and Auto-Healing Project</h1>
    <p>Website hosted on Amazon EC2.</p>
    <p>Monitoring: Amazon CloudWatch</p>
    <p>Recovery: EC2 Auto Scaling</p>
</body>
</html>
EOF
