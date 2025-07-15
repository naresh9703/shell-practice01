#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then
    echo "user is not running with root access, please check the RC are re run"
    exit 1
else
    echo "user is running with root access"
fi