#!/bin/bash
greeting="Welcome"
user=$(whoami) # command substitution. Meaning that the output of the whoami command will be directly assigned to the user variable. 
day=$(date +%A)
echo "$greeting mister $user, today it is $day"
echo "Bash version: $BASH_VERSION"
a=10
b=2
echo $a
echo $[$a + $b] # stdout
tot=$(($a + $b)) # assign var
echo $tot