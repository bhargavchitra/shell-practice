#!/bin/bash

set -e #ERR 


trap 'echo  "There is an error in $LIENO, Command: $BASH_COMMAND"' ERR

echo "Hello World"
echo "i am learning shell"
echoo "printing error here"
echo "no error "





