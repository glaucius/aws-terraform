#!/bin/bash
sudo yum -y update
sudo yum -y install httpd
sudo systemctl start httpd
sudo systemctl enable httpd
sudo echo "<html><body><h1>Hello World</h1></body></html>" > /var/www/html/check.html 
sudo chmod 777 /var/www/html/check.html