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

log(){
    echo -e "$(date "+%y-%m-%d %H:%M:%S") | $1" | tee -a $LOGS_FILE
}

if [ $# -lt 2 ]; then
   USAGE 
fi 

if [ ! -d $SOURCE_DIR ]; then 
     echo -e "source directory: $SOURCE_DIR does not exist" 
     exit 1
fi 

if [ ! -d $DEST_DIR ]; then 
     echo -e " destination directory:  $DEST_DIR does not exist" 
     exit 1
fi 

 # find the files
FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

log "Backup started" 
log "source Directory: $SOURCE_DIR"
log "Destination Directory: $DEST_DIR"
log "Days: $DAYS" 

if [ -z "{$FILES}" ]; then 
    log "No files to archieve...$Y skipping $Y" 
else 
   # app-logs-$timestamp.zip
   log "files found to archieve: $FILES"
   TIMESTAMP=$(date +%F-%H-%M-%S)
   ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIMESTAMP.tar.gz"
   echo "Archieve name: $ZIP_FILE_NAME"
   find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS | tar -zcvf $ZIP_FILE_NAME

   # check archieve is success or not 
    if [ -f $ZIP_FILE_NAME ]; then 
       log "Archeival is.. $R success $R"

       while IFS= read -r filepath; do
       # process each line here 
       echo "Deleting file: $filepath"
       rm -f $filepath
       echo "Deleting file: $filepath"
       done <<< $FILES
    else
       log "Archeival is ... $G FAILURE $g" 
       exit 1
    fi 
     
fi 
