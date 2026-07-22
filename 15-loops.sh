#!/bin/bash 

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"

if [ $USERID -ne 0 ]; then
    echo "Please run this script as root user access"
    exit 1
fi

mkdir -p $LOGS_FOLDER

VALIDATE(){
    if [ $? -ne 0 ]; then
        echo "$2  ... FAILURE" | tee -a $LOGS_FILE
        exit 1
  else
       echo "$2   ... success" | tee -a $LOGS_FILE
 fi
}

for package in $@   #sudo sh 14-loops.sh nginx mysql nodejs 
do
     dnf list installed $package &>> $LOGS_FILE
     if [ $? -ne 0 ]; then 
         echo "$package not installed, installing now" 
         dnf install $package -y &>> $LOGS_FILE
         VALIDATE $? "$package installation"
    else
         echo "$package already installed" skipping "
    fi
done


















