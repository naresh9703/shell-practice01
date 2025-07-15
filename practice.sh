#!/bin/bash

NUMBER=$1

# -gt --> greater than
# -lt --> less than
# -eq --> equal
# -ne --> not equal
if [ $NUMBER -gt 20 ]
then 
    echo "Given number $Number is greater then 20 "
elif
    echo "Given number $Number is less then 20"
else 
   echo "Given number $Number is not equal to 20"
fi