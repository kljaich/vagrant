#!/bin/bash

# Update CentOS with any patches, exclude kernal packages
yum update -y --exclude=kernal

# Tools
yum install -y nano git unzip screen

# Apache
yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on

# Need to stop Apache (if happens to be running) to remove the html directory
service httpd stop
rm -rf /var/www/html

# Symbolically link Guest and Host directories
ln -s /vagrant /var/www/html

# Start up Appache
service httpd start

# PHP
yum install -y php php-cli php-common php-devel php-mysql

# MySQL
yum install -y mysql mysql-serverl mysql-devel
chkconfig --add mysqld 
chkconfig mysqld on

service mysqld start

# By default no root password with CentOS (change later)
mysql -u root -e "SHOW DATABASES";


# Download Starter Content

# First go to /vagrant directory (as root)
cd /vagrant

# Copy files as vagrant login/account (not as root).  Note, -q quite mode
sudo vagrant wget -q https://raw.githubusercontent.com/kljaich/vagrant/master/files/index.html
sudo vagrant wget -q https://raw.githubusercontent.com/kljaich/vagrant/master/files/info.php

# Restart Apache
service httpd restart