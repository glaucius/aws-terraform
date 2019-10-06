#!/bin/bash
sudo yum -y update
sudo yum -y install mariadb
sudo systemctl start mysqld
sudo systemctl enable mysqld
