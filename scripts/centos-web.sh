#!/bin/bash

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

# Download Starter Content

# First go to /vagrant directory (as root)
cd /vagrant

# Copy files as vagrant login/account (not as root).  Note, -q quite mode
sudo -u vagrant wget -q https://raw.githubusercontent.com/kljaich/vagrant/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/kljaich/vagrant/master/files/info.php

# Restart Apache
service httpd restart