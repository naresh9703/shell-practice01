#!/bin/bash

userid=$(id -u)

if [ userid -ne 0 ]
then
    echo "Error:please run the script with root access.."
    #exit 1
else
    echo "your running with root access"
fi

dnf install mysql -y

if [ $? -eq 0 ]
then
    echo "installing mysql is success...."
else
    echo "installing mysql is failure....."
    #exit 1
fi