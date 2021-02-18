#!/bin/bash


#Establishing where to find scripts
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE}" )" >/dev/null && pwd )"

if [ -z "$PIPELINE" ]
then
    printf "Error no PIPELINE env. var.\nValue must match a file in the ./configuration "
    exit 1
fi

#Establishing which config file we will use for environment variables
CONFIG_FILE="$SCRIPTDIR/../configuration/$PIPELINE.cfg"

source "$CONFIG_FILE" 2> /dev/null
if [ ! $? -eq 0 ]
then
    printf "Error cannot fint configuration file $CONFIG_FILE\n"
    exit 1
fi

printf "Success configuration file ($CONFIG_FILE)\n"


RG_GROUP=$MASTER_PREFIX"-sh-rg"
echo $RG_GROUP

# subscriptions
az account show --query id -o json | tr -d '"'

echo "Resource group info"
RESULT_RG= az resource list --resource-group $RG_GROUP # --subscription $S_NAME
echo "Virtual machine info"
RESULT_VM= az vm list --resource-group $RG_GROUP # --subscription $S_NAME
echo "Disk info"
RESULT_DISK= az disk list --resource-group $RG_GROUP # --subscription $S_NAME