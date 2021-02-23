#!/bin/bash


# Location script
LOCATION_SCRIPT="$( cd "$( dirname "${BASH_SOURCE}" )" >/dev/null && pwd )"

if [ -z "$PIPELINE" ]
then
    printf "Error no PIPELINE env. var.\nValue must match a file in the ./configuration "
    exit 1
fi

# Location configuration
CFG_FILE="$LOCATION_SCRIPT/../configuration/$PIPELINE.cfg"

source "$CFG_FILE" 2> /dev/null
if [ ! $? -eq 0 ]
then
    printf "Error cannot fint configuration file $CFG_FILE\n"
    exit 1
fi

printf "Success configuration file ($CFG_FILE)\n"


RG_GROUP="cloud-shell-storage-westeurope" # $MASTER_PREFIX"-sh-rg"
echo $RG_GROUP

RG_EXISTS= az group exists --name $RG_GROUP

RG_RESULT= az group delete --name $RG_GROUP

var= true
if [ $? -eq 0 ]
then
    echo "yes"
else
    echo "no"
fi


