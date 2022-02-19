#!/bin/bash

dnf update -y

dnf upgrade -y

dnf install httpd mariadb-server php php-mysqlnd -y 

systemctl start httpd mariadb php-fpm 

systemctl enable httpd mariadb php-fpm 

firewall-cmd --permanent --add-service=http

firewall-cmd --permanent --add-service=https

firewall-cmd --reload
