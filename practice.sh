#!/bin/bash

Value1=$1
Value2=$2
Value3=$3

Timestamp=$(date)
echo "Script executed at $Timestamp"

Sum=$(($1+$2+$3))

echo "Sum of $Value and $Value2 and $Value3 is: $Sum"

sleep 2

echo "Script execute at $Timestamp"