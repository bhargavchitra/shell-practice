#!/bin/bash 

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Please run this script as root user or with sudo"
    exit 1
fi

#by default shell will not exicuted when called 
VALIDATE(){
    if [ $? -ne 0 ]; then
        echo "$1  ... FAILURE"
        exit 1
  else
       echo "$2   ... success"
 fi
}

dnf install nginx -y 
VALIDATE $? "Installing Nginx"


dnf install mysql -y
VALIDATE $?  "Installing MySQL"

dnf install nodejs -y 
VALIDATE $? "Installing Node.js"