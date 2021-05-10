#!/bin/bash

echo "Positional parameters"
# so far the 11_backup.sh is ok, but we are always using
# the same dir to back up, now we change it to a paramters

# 1 input param
# print 1 and 2 paramter when running 12_param.sh tim burton
echo $1 $2 
# num of parameters
echo $#
# print all
echo $*

# z simply returns true if the length of the string which in our case is variable $1 is zero
if [ -z $1 ]; then
    echo "no first input/args or parameter"
else
    echo "Input is $1"
fi

