#!/bin/bash 

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Please run this script as root user or with sudo"
    exit 1
fi
echo "Installing Nginx"
dnf install nginx -y 


if [ $? -ne 0 ]; then
    echo "Installing  Nginx  ... FAILURE"
    exit 1
else
    echo "Installing Nginx ... success"
fi



dnf install mysql-y
if [ $? -ne 0 ]; then
    echo "Installing  MySQL  ... FAILURE"
    exit 1
else
    echo "Installing MySQL ... success"
fi


dnf install nodejs -y 
if [ $? -ne 0 ]; then
    echo "Installing  Node.js  ... FAILURE"
    exit 1
else
    echo "Installing Node.js ... success"
fi

