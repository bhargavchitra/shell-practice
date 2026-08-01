#!/bin/bash 

NUM1=100
#NUM=200
NUM2=bhargav         #letter value 0 

SUM=$(($NUM1+$NUM2))

echo "Sum is: $SUM"




#arrays
FRUITS=("apple" "banana" "orange")

echo "Fruits are: ${FRUITS[@]}"    #its print all 
echo "Firest are: ${FRUITS[0]}" 
echo "Second are: ${FRUITS[1]}" 
echo "Third are:  ${FRUITS[2]}" 