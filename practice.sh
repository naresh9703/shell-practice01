#!/bin/bash

NUMBER=$1

# -gt --> greater than
# -lt --> less than
# -eq --> equal
# -ne --> not equal
if [ $NUMBERumber -gt 20 ]
then 
    echo "Given number is greater then $Number"
else
    echo "Given number is less then $Number"
fi