#!/bin/bash
USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"


CHKROOT(){
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
    echo -e  "$2 is ... $R FAILED $N"
    exit 1
else
    echo -e "$2 is ...  $G SUCCESS $N"
fi
}

CHKROOT

for package in {$@}
do
dnf list installed $package
if [ $? -ne 0 ]
then
    echo "package is not installed going to install it.."
    dnf install $package -y
    VALIDATE $? "Installing $package"
else
    echo "$package already installed nothing to do"
done

dnf list installed git

# if [ $? -ne 0 ]
# then 
#     echo "GIT is not installed going to install it.."
#     dnf install git -y
#     VALIDATE $? "Installing GIT"
# else
#     echo "GIT already installed nothing to do"
# fi

# dnf list installed mysql

# if [ $? -ne 0 ]
# then 
#     echo "MYSQL is not installed going to install it.."
#     dnf install mysql -y
#     VALIDATE $? "Installing MYSQL"
# else
#     echo "MYSQL already installed nothing to do"
# fi