#!/bin/bash

str_a="UNIX"
str_b="GNU"
echo "Are $str_a and $str_b strings equal?"
[ $str_a = $str_b ]
echo $?

num_a=100
num_b=100

echo "Is $num_a equal to $num_b ?"
[ $num_a -eq $num_b ]
echo $?