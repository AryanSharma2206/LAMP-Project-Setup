#!/bin/bash
set -e

# Redirect output to log file for debugging
exec > /var/log/lamp_setup.log 2>&1

echo "Updating package list..."
apt update -y

echo "Installing Apache..."
apt install apache2 -y

echo "Installing MySQL Server..."
DEBIAN_FRONTEND=noninteractive apt install mysql-server -y

echo "Installing PHP and modules..."
apt install php libapache2-mod-php php-mysql -y

echo "Enabling and starting Apache service..."
systemctl enable apache2
systemctl start apache2

echo "Creating PHP info page..."
echo "<?php phpinfo(); ?>" > /var/www/html/index.php

echo "Verifying installations..."

# Apache version
echo "Apache Version:"
apache2 -v

# MySQL version
echo "MySQL Version:"
mysql --version

# PHP version
echo "PHP Version:"
php -v

# Check Apache status
echo "Apache status:"
systemctl status apache2 | grep Active

echo "LAMP stack installation completed successfully!"

