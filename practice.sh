#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then
    echo "user is not running with root access, please check the RC are re run"
    #exit 1
else
    echo "user is running with root access"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "my sql is not installed need to install"
    dnf install mysql -y
elif [ $? -eq 0 ]
then
    echo "install the mysql"
else
    echo "installing my sql is already exist"
fi

