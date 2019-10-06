#!/bin/bash
sudo yum -y update
sudo yum -y install mariadb-server
sudo systemctl start mysqld
sudo systemctl enable mysqld
