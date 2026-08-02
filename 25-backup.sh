#!/bin/bash


USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/backup.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
M="\e[35m"
C="\e[36m"
W="\e[37m"
N="\e[0m"
SOURCE_DEL=$1
DEST_DIR=$2 
DAYS=${3:-14} # 14 days is the default value, if the user not supplied 

if [ $USERID -ne 0 ]; then
    echo -e "$R Please run this script as root user access $N" 
fi

mkdir -p $LOGS_FOLDER

USAGE(){
    echo -e "sudo backup <SOURCE_DEL> <DEST_DIR> <DAYS>[default 14 days]"
    exit 1 
}

if [ $# -lt 2 ]; then
   USAGE 
fi 

if [ ! -d $SOURCE_DIR ]; then 
     echo -e " $SOURCE_DIR does not exist" 
     exit 1
fi 

if [ ! -d $DEST_DIR ]; then 
     echo -e " $DEST_DIR does not exist" 
     exit 1
fi 




