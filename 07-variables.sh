#!/bin/bash

######### Special variables  

echo "All args passed to script: $@"
echo "Number of variables passed to script: $#"
echo "Script name: $0 "
echo "Present  directory: $PWD"
echo "Who is running: $USER"
echo "Home directory of current user: $HOME"
echo "PID of this script: $$"
sleep 100 &
echo "PID of recently executed background process: $!"
echo "All args passed to script: $*"





