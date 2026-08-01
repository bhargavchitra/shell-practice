#!/bin/bash 

LOGS_DIR=/home/ec2-user/app-logs
LOGS_FILE="$LOGS_DIR/$0.log"

if [ ! -d $LOGS_DIR ]; then 
    echo -e "$LOGS_DIR does not exists"
    exit 1
fi 

FILE_TO_DELETE=$(find $LOGS_DIR -name "*.log" -mtime +14)
echo "$FILES_TO_DELETE"
