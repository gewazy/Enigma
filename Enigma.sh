#! /bin/bash

check_message() {
re='^[A-Z ]+$'

if [[ $message =~ $re ]]; then
    echo "This is a valid message!"
else
    echo "This is not a valid message!"
fi
}


############################################# 
echo -e "Enter a message:"
read -r message

check_message $message
