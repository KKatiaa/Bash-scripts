#!/bin/bash

if [ "$1" = "-help" ]; then
    echo "This script installs mysql package and create user"
fi

read -p "Do you want to install mysql server and create user? (y/n)" answer
echo $answer
if [ "$answer" = "y" ]; then
    sudo apt-get install mysql-server
    sudo systemctl start mysql.service
    read -p "Enter database user:" username
    read -p "Enter the PASSWORD for database user!" userpass
    sudo mysql -e "CREATE USER '${username}'@'localhost' IDENTIFIED BY '${userpass}'"

    sudo mysql -e "GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, ALTER ON * . * TO '${username}'@'localhost';"
elif [ "$answer" = "n" ]; then
    echo "Good bye!"
    exit
else 
    echo "Please enter y(yes) or n(no)"
    sudo sh bash_script.sh
fi
