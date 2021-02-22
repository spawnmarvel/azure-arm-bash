#!/bin/bash
# https://linuxconfig.org/bash-scripting-tutorial-for-beginners

greeting="Welcome"
user=$(whoami)
day=$(date +%A)
echo "$greeting mister $user, today it is $day"
echo "Bash version: $BASH_VERSION"