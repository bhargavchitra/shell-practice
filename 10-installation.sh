#!/bin/bash 

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "please run this script as root user or with sudo"
    exit 1
fi

echo "Installing Nginx"
dnf install nginx -y 

if [ $? -ne 0 ]; then
    echo "Nginx installation failure"
    exit 1
else
    echo "Nginx installation success"
fi 


if [ $? -ne 0 ]; then
    echo "mysql installation failure"
    exit 1
else
    echo "mysql installation success"
fi 



if [ $? -ne 0 ]; then
    echo "Nodejs installation failure"
    exit 1
else
    echo "Nodejs installation success"
fi 