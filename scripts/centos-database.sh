#!/bin/bash

# MySQL
yum install -y mysql mysql-server mysql-devel
chkconfig --add mysqld 
chkconfig mysqld on

service mysqld start

# By default no root password with CentOS (change later)
mysql -u root -e "SHOW DATABASES";