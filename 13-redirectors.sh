#!/bin/bash
USERID=$(id -u)

R="\e[32m"
G="\e[33m"
N="\e[0m


CHKROOT{
    if [ $USERID -ne 0 ]
    then
        echo "Please run this script with root privilages"
        exit 1
    else
        echo "Used id is: $USERID"
fi
}

VALIDATE(){
if [ $1 -ne 0 ] 
then 
    echo -e "$2 is ...$R FAILED $N"
    exit 1
else
    echo -e "$2 is ... $G SUCCESS $N"
fi
}

CHKROOT

dnf list installed git

if [ $? -ne 0 ]
then 
    echo "GIT is not installed going to install it.."
    dnf install git -y
    VALIDATE $? "Installing GIT"
else
    echo "GIT already installed nothing to do"
fi

