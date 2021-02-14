RG_GROUP="test-az-rg"
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

# One argument supported, test will execute AZ CLI in what-if mode if possible (deployments)
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

az deployment group $MODE \
    --mode Incremental \
    --resource-group $RG_GROUP \
    --name $DEPLOY_NAME \
    --template-file template.json \
    --parameters @vm.parameters.json \
    --parameters adminUsername="ladmin" \
    --parameters adminPassword="$PWORD" \
    --output table

echo "To create the resource, give the argument <create>, now mode was: $MODE"
echo "Deploy name: $DEPLOY_NAME"
echo "Password: $PWORD"

if [ $MODE = "create" ]
then
    az deployment group show \
    --resource-group $RG_GROUP \
    --name $DEPLOY_NAME \
    --query properties.outputs.adminUsername.value
fi
