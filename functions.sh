#!/bin/bash

userid=$(id -u)

if [ userid -ne 0 ]
then
    echo "Error:please run the script with root access.."
    exit 1
else
    echo "your running with root access"
fi

VALIDATE(){
    if [ $1 -eq 0 ]
then
    echo "installing $2 is success...."
else
    echo "installing $2 is failure....."
    exit 1
fi

}
dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "My sql is not installed...going to install it..."
    dnf install mysql -y
    VALIDATE $? "mysql"
else
    echo "my sql is already installed...nothing to do.."
fi

dnf list installed python3
if [ $? -ne 0 ]
then
    echo "python3 is not installed...going to install it..."
    dnf install python3 -y
    VALIDATE $? "mysql"
else
    echo "python3 is already installed...nothing to do.."
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx is not installed...going to install it..."
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo "nginx is already installed...nothing to do.."
fi