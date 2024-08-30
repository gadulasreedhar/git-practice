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
    echo "Git is not installed going to install it.."
    dnf install git -y
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

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "mysql is not installed going to install it.."
    dnf install mysql -y
    if [ $? -ne 0]
    then
        echo "mysql installation is not successfull.check it"
        exit 1
    else   
        echo "mysql installation successfule"
    fi
else
    echo "mysql already installed nothing to do"
fi