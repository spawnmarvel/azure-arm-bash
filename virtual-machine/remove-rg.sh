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


RG_GROUP=$MASTER_PREFIX"-sh-rg"
echo "Name of rg; $RG_GROUP"

RG_EXISTS= az group exists --name $RG_GROUP
echo "Does rg exist; $RG_EXISTS"

RG_RESULT= az group delete --name $RG_GROUP --no-wait --yes -y #--subscription
echo $RG_RESULT

echo "It can take anything form 5-20 min before rg is removed from Azure"
echo "When: ResourceNotFoundError: Resource group 'your-rg' could not be found. Then all resources are gone"

# 
# https://www.oreilly.com/library/view/bash-cookbook/0596526784/ch07s03.html

echo "Just a bool test"
var= true
if [ $? -eq 0 ]
then
    echo "yes"
else
    echo "no"
fi


