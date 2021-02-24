#!/bin/bash

#This script us used to backup a user's homd dir to /tmp
echo "Starting backup"
user=$(whoami)
 to much data here
# input=/home/$user
# using the test folder to simulate

input=/home/$user/test
output=/tmp/${user}_home_$(date +%Y-%m-%d_%H%M%S).tar.gz

tar -czf $output $input
echo "Backup of $input completed. Details:"
ls -l $output