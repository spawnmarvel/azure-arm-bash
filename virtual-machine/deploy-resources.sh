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
az group create --name $RG_GROUP --location "west europe"
# subscriptions
az account show --query id -o json | tr -d '"'
# pass generator
RAN=$RANDOM
PWORD=$RANDOM
PWORD+="vmAdminKey"
# random number for deploy name
RAN=$RANDOM
DEPLOY_PREFIX="azdeploy"
DEPLOY_NAME="deployeNumber"
DEPLOY_NAME+=$RAN
echo $DEPLOY_NAME | tr -d '{}'

if [ $# -eq 0 ] # number of arguments.
then
    MODE="what-if"
else
    if [ $1 = "create" ]
    then
        MODE="create"
    else
        MODE="what-if"
    fi
fi

# --subscription $S_NAME

az deployment group $MODE \
    --mode Incremental \
    --resource-group $RG_GROUP \
    --name $DEPLOY_NAME \
    --template-file template.json \
    --parameters @vm.parameters.json \
    --parameters adminUsername="superteddy" \
    --parameters adminPassword="$PWORD" \
    --output table

echo "To create the resource, give the argument <create>, now mode was: $MODE"
echo "Deploy name: $DEPLOY_NAME"
echo "Password: $PWORD"

if [ $MODE = "create" ]
then
    az deployment group show 
    # subscription $S_NAME
    --resource-group $RG_GROUP \
    --name $DEPLOY_NAME \
    --query properties.outputs.adminUsername.value
fi
