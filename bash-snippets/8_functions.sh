#!/bin/bash

#This script is used to backup a user's home dir to /tmp
echo "Starting backup"
user=$(whoami)
# to much data here
# input=/home/$user
# using the test folder to simulate

input=/home/$user/test
output=/tmp/${user}_home_$(date +%Y-%m-%d_%H%M%S).tar.gz

# func total files in dir
function total_files {
    find $1 -type f | wc -l
}

# func total dirs
function total_directories {
    find $1 -type d | wc -l
}
# Now that we have a basic understanding of the output redirection we can eliminate this unwanted stderr message by redirecting it with 2> notation to /dev/null. 
# Imagine /dev/null as a data sink, which discards any data redirected to it.
tar -czf $output $input 2> /dev/null

echo -n "Files to include:"
total_files $input

echo -n "Dirs to include:"
total_directories $input

echo "Backup of $input completed. Details:"
ls -l $output

# function multiple args
function mult_args {
    echo $1
    echo $2
}
var1="var1"
var2=2
mult_args $var1 $var2
