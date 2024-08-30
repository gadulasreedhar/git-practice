#!/bin/bash

USERID=$(id -u)

R="/e[31m"
G="/e[32m"
N="/e[0m

CHKROOT(){
if [ $USRDID -ne 0]
then
    echo "Please run this script with root privilage"
    exit 1
fi
}

CHKROOT


