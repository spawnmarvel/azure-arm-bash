#!/bin/bash

echo "Conditional Statments"
num_a=100
num_b=200
if [ $num_a -lt $num_b ]; then
    echo "a < b"
else
    echo "a > b"
fi
