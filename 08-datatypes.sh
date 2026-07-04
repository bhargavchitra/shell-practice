#!/bin/bash 

NUM1=100
#NUM=200
NUM2=bhargav

SUM=$(($NUM1+$NUM2))

echo "Sum is: $SUM"



#arrays

FRUITS=("apple" "banana" "orange")


echo "Fruits are: ${FRUITS[@]}" 
echo "Firest are: ${FRUITS[0]}" 
echo "Second are: ${FRUITS[2]}" 
echo "Third are:  ${FRUITS[3]}" 