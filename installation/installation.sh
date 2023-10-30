#!/bin/sh

# Download Executable
sudo apt update
sudo apt --assume-yes install apache2
sudo apt --assume-yes install certbot python3-certbot-apache

# Enable Ubuntu Firewall
sudo ufw enable
sudo ufw app list
sudo ufw allow 'Apache Full'
sudo ufw status

# Set Apache Server Name
sudo su -
echo ServerName www.hailicorn.com >> /etc/apache2/apache2.conf

# Create Virtual Host
sudo mkdir /var/www/hailicorn.com
sudo chown -R $USER:$USER /var/www/hailicorn.com
sudo chmod -R 755 /var/www/hailicorn.com

# Download Web content
cd /var/www/hailicorn.com
git clone https://github.com/hailicorn/website
sudo cp -p /var/www/hailicorn.com/website/installation/hailicorn.com.conf /etc/apache2/sites-available/hailicorn.com.conf

# Enable Apache Virtual Host
cd /etc/apache2/sites-available/
sudo a2ensite hailicorn.com.conf
sudo a2dissite 000-default.conf
sudo systemctl reload apache2

# Grep Current IP Address
echo http://`curl -s -4 icanhazip.com`

# Request Certifcate from certbot
sudo certbot --apache --non-interactive --agree-tos -m normankong@gmail.com -d www.hailicorn.com

# Check Configuration and Restart
apachectl configtest
sudo systemctl restart apache2

# Test Local
curl https://localhost

# Reference
# https://www.digitalocean.com/community/tutorials/how-to-install-the-apache-web-server-on-ubuntu-22-04
# https://www.digitalocean.com/community/tutorials/how-to-secure-apache-with-let-s-encrypt-on-ubuntu-22-04