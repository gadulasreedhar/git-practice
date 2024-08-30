#!/bin/bash

USERID=$(id -u)
#echo $USERID

if [ $USERID -ne 0 ]
then
 echo "Please run this script with root privilages"
 exit 1
fi

dnf list installed git

if [ $? -ne 0 ]
then
    echo "Git is not installed goint to install it.."
    dnf install git -y
else
    echo "Git already installed nothing to do"
fi