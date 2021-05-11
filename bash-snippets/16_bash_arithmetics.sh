#!/bin/bash

echo "Bash aritmetics, +, -, *, /"
a=12
b=2
c=$(( a + b ))
echo $c

aa=$(( 12 + 2 ))
echo $aa

echo "expr without brackets or quotes, just beware of *"
expr 2 + 2
expr 2 \* 3

echo "let, evaluates a math expr and stores it result in a var"
let a=2*10
echo $a
# let b=2.34+3 gives error, for decimal must use bc

# The return value is stored in $?. 0 indicates success, others indicates error.
f= cat nafile.txt
if [ $? -eq 0 ]; then
    echo "File exist"
else 
    echo "File does not exist"
fi

echo "bc is used for decimal and arithmetics"
echo '2.3 + 2.3' | bc
