#!/bin/bash

user=$(whoami)
echo $user
input=/home/$user/testhome
output=/tmp/${user}_test_home_$(date +%Y-%m-%d_%H%M%S).tar.gz

function total_files {
    find $1 -type f | wc -l
}

function total_directories {
    find $1 -type d | wc -l
}

function total_archived_directories {
    tar -tzf $1 | grep /$ | wc -l
}

function total_archived_files {
    tar -tzf $1 | grep -v /$ | wc -l
}

tar -czf $output $input 2> /dev/null

src_files=$( total_files $input)
src_directories=$( total_directories $input)
arc_files=$( total_archived_files $output)
arc_directories=$( total_archived_directories $output)


echo "Total files $src_files"
echo "Total directories $src_directories"
echo "Total archived files $arc_files"
echo "Total acrhived directories $arc_directories"

if [ $src_files -eq $arc_files ]; then
    echo "Backup of $input is completed"
    echo "Details about output file"
    ls -l $output
else
    echo "Backup of $input failed!"
fi