#!/bin/bash

USERID=$(id -u)
#echo $USERID

if [ $USERID -ne 0 ]
then
 echo "Please run this script with root privilages"
 exit 1
fi

dnf list installed gitt

if [ $? -ne 0 ]
then
    echo "Git is not installed goint to install it.."
    dnf install gitt -y
    if [ $? -ne 0 ]
    then
        echo "Git installation is not successfull.check it"
        exit 1
    else
        echo "Git installation is successfull"
    fi
else
    echo "Git already installed nothing to do"
fi