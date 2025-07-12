 #!/bin/bash

userid=$(id -u)
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("mysql" "python3" "nginx" "httpd")   


mkdir -p $LOGS_FOLDER
echo "Script started executing at:$(date)" | tee -a $LOG_FILE

if [ userid -ne 0 ]
then
    echo "Error:please run the script with root access.." | tee -a $LOG_FILE

    exit 1
else
    echo "your running with root access" | tee -a $LOG_FILE
fi

VALIDATE(){
    if [ $1 -eq 0 ]
then
    echo "installing $2 is success...."  | tee -a $LOG_FILE

else
    echo "installing $2 is failure....." | tee -a $LOG_FILE

    exit 1
fi

}

#for package in ${PACKAGES[@]}
for package in $@
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
then
    echo "$package is not installed...going to install it..." | tee -a $LOG_FILE

    dnf install $package -y &>>$LOG_FILE

    VALIDATE $? "$package"
else
    echo "$package is already installed...nothing to do.." | tee -a $LOG_FILE

fi
done




