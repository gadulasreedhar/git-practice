#!/bin/bash
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"


CHKROOT(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$R Please run this script with root privilages. $N" &>>$LOG_FILE
        exit 1 
    # else
    #     echo "Used id is: $USERID"
   fi
}
VALIDATE(){
if [ $1 -ne 0 ] 
then 
    echo -e  "$2 is ... $R FAILED $N"
    exit 1
else
    echo -e "$2 is ...  $G SUCCESS $N"
fi
}
USAGE(){
    echo -e "$R USAGE $N :: sudo sh 14-redirectors.sh package1 package2 ..."
    exit 1
}

echo "Scipt started executed at:$(date)" &>>$LOG_FILE

CHKROOT

if [ $# -eq 0 ]
then
    USAGE
fi

for package in $@
do
dnf list installed $package
if [ $? -ne 0 ]
then
    echo "$package is not installed going to install it.." &>>$LOG_FILE
    dnf install $package -y &>>$LOG_FILE
    VALIDATE $? "Installing $package"
else
    echo -e "$package already $Y installed nothing to do $N" &>> $LOG_FILE
fi
done
