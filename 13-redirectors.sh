#!/bin/bash
USERID=$(id -u)


if [ $USERID -ne 0 ]
then
    echo "Please run this script with root privilages"
    exit 1
else
    echo "Used id is: $USERID"
fi

VALIDATE(){
if [ $1 -ne 0 ] 
then 
    echo "$2 is ...FAILED"
    exit 1
else
    echo "$2 is ...SUCCESS"
fi
}

dnf list installed git

if [ $? -ne 0 ]
then 
    echo "GIT is not installed going to install it.."
    dnf install git -y
    VALIDATE $? "Installing GIT"
else
    echo "GIT already installed nothing to do"
fi

