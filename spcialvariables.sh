#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then
    echo "This is not root access, try to connect with root access"
    exit 1
else
    echo "logged in with root access"
fi

logfolder="/var/log/shellscript-logs"
logscript=$(echo "$0" | cut -d "."-f1)
logfile="$logfolder/$logscript.log"

mkdir -p $logfolder

packages=("mysql" "python3" "nginx") | tee -a $logfile
validation(){
    if [ $1 -eq 0 ]
then
    echo "installing $2 is successfull" | tee -a $logfile
else
    echo "installing $2 is failure" | tee -a $logfile
    exit 1
fi
}

for package in $@
do
if [ $? -ne 0 ]
then
    echo "$package is not installed ...trying to install the package" | tee -a $logfile
    dnf install $package -y &>>logfile
    validate $? "$package"
else
    echo "$package is already installed no need to install the package" | tee -a $logfile
fi
done