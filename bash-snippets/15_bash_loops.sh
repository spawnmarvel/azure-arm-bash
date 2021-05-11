#!/bin/bash

echo "loops"
echo "For loop"
for i in 1 2 3; do
    echo $i
done


echo "Stdout all the content in the items.txt"
echo cat items.txt

for i in $( cat items.txt ); do
    echo -n $i | wc -c -w; 
    # wc  word count
    # -c char count
    # -w word count
done

echo "While loop"
counter=0
while [ $counter -lt 3 ];do
    let counter+=1
    # let is used to evaluate arithmetic exp
    echo $counter
done

echo "Until loop"
counter=6
until [ $counter -lt 3 ]; do
    let counter-=1
    echo $counter
done
