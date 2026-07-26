#!/bin/bash 

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Please run this script as root user or with sudo"
    exit 1
fi

#by default shell will not exicuted when called 
VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "  ... FAILURE"
        exit 1
  else
       echo "   ... success"
 fi
}
    
dnf install nginx -y 
VALIDATE $? "Installing Nginx"


dnf install mysql -y
VALIDATE $?  "Installing MySQL"

dnf install nodejs -y 
VALIDATE $? "Installing Node.js"