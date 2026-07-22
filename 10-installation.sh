#!/bin/bash 

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "please run this script as root user or with sudo"
fi
echo "Installing Nginx"
dnf install nginx -y 




