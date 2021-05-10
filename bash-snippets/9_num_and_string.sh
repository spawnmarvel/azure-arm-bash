#!/bin/bash
echo "Numbers and String comparison"
echo "Square brackets and var ? for return value 0 (True),1 (False) "
num1=10
num2=30
# less than
[ $num1 -lt $num2 ]
echo $? 
# greater than
[ $num2 -gt $num1 ]
echo $?
# not equal
[ $num1 -ne $num2 ] 
echo $?
num2=10
# equal
[ $num1 -eq $num2 ]
echo $?
# less or equal
[ $num1 -le $num2 ]
echo $?
# greater or equal
[ $num1 -ge $num2 ]
echo $?

echo "Strings"
[ "apples" = "oranges" ]
echo $?
echo "Strings, <, >, = !="
