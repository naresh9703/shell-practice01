#!/bin/bash

userid=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[34m"

if [ $userid -ne 0 ]
then
    echo -e "$R user is not running with root access, please check the RC are  $G re run"
    #exit 1
else
    echo "user is running with root access"
fi

validate(){
    if [ $1 -eq 0 ]
    then
        echo "Installing $2 is success"
    else
        echo "Installing $2 is failure"
        exit 1
fi
}

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "my sql is not installed need to install"
    dnf install mysql -y
    validate $? "mysql"
else
    echo "installing my sql is already exist"
fi

dnf list intalled nginx

if [ $? -ne 0 ]
then 
    echo "nginx is not installed need to be install"
    dnf install nginx -y
    validate $? "nginx"
else
    echo "installing nginx is already exist"
fi
