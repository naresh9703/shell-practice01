 #!/bin/bash

userid=$(id -u)
LOGS_FOLDER="/var/logs/shell/shell-practice01-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script started executing at:$(date)" &>>$LOG_FILE

if [ userid -ne 0 ]
then
    echo "Error:please run the script with root access.." &>>$LOG_FILE

    exit 1
else
    echo "your running with root access"
fi

VALIDATE(){
    if [ $1 -eq 0 ]
then
    echo "installing $2 is success...."  &>>$LOG_FILE

else
    echo "installing $2 is failure....." &>>$LOG_FILE

    exit 1
fi

}
dnf list installed mysql &>>$LOG_FILE

if [ $? -ne 0 ]
then
    echo "My sql is not installed...going to install it..." &>>$LOG_FILE

    dnf install mysql -y &>>$LOG_FILE

    VALIDATE $? "mysql"
else
    echo "my sql is already installed...nothing to do.." &>>$LOG_FILE

fi

dnf list installed python3 &>>$LOG_FILE

if [ $? -ne 0 ]
then
    echo "python3 is not installed...going to install it..." &>>$LOG_FILE

    dnf install python3 -y &>>$LOG_FILE

    VALIDATE $? "mysql"
else
    echo "python3 is already installed...nothing to do.." &>>$LOG_FILE

fi

dnf list installed nginx &>>$LOG_FILE

if [ $? -ne 0 ]
then
    echo "nginx is not installed...going to install it..." &>>$LOG_FILE

    dnf install nginx -y &>>$LOG_FILE

    VALIDATE $? "nginx"
else
    echo "nginx is already installed...nothing to do.." &>>$LOG_FILE

fi




