#!/bin/bash

userid=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[34m"

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script started executing at: $(date)" | tee -a $LOG_FILE


if [ $userid -ne 0 ]
then
    echo -e "$R user is not running with root access, please check the RC are  $G re run" | tee -a $LOG_FILE
    exit 1
else
    echo "user is running with root access" | tee -a $LOG_FILE
fi

validate(){
    if [ $1 -eq 0 ]
    then
        echo -e "Installing $2 is $R success $R" | tee -a $LOG_FILE
    else
        echo -e "Installing $2 is $R failure $R" | tee -a $LOG_FILE
        exit 1
fi
}

dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo "my sql is not installed need to install" | tee -a $LOG_FILE
    dnf install mysql -y &>>$LOG_FILE
    validate $? "mysql" 
else
    echo "installing my sql is already exist" | tee -a $LOG_FILE
fi

dnf list intalled nginx &>>$LOG_FILE

if [ $? -ne 0 ]
then 
    echo "nginx is not installed need to be install" | tee -a $LOG_FILE
    dnf install nginx -y &>>$LOG_FILE
    validate $? "nginx"
else
    echo "installing nginx is already exist" | tee -a $LOG_FILE
fi
