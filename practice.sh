#!/bin/bash

NUMBER=$1

# -gt --> greater than
# -lt --> less than
# -eq --> equal
# -ne --> not equal
if [ $NUMBER -gt 20 ]
then 
    echo "Given number $NUMBER is greater then 20 "
elif [ $NUMBER -lt 20 ]
    echo "Given number $NUMBER is less then 20"
then
else 
   echo "Given number is $NUMBER not equal to 20"
fi