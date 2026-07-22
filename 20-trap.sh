#!/bin/bash 
set -e 
trap 'echo  "There is an error in $LIENO, Command: $BASH_COMMAND"' ERR


USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
M="\e[35m"
C="\e[36m"
W="\e[37m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
    echo "$R Please run this script as root user access $N" | tee -a $LOGS_FILE
    exit 1
fi

mkdir -p $LOGS_FOLDER

for package in $@   #sudo sh 14-loops.sh nginx mysql nodejs 
do
     dnf list installed $package &>> $LOGS_FILE
     if [ $? -ne 0 ]; then 
         echo "$package not installed, installing now" 
         dnf install $package -y &>> $LOGS_FILE
         VALIDATE $? "$package installation"
    else
        echo "$package already installed... $Y skipping $N"
    fi
done




