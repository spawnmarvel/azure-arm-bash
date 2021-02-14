# If the execution of the scipt is denied set chmod +x filename
# If proxy error, set export no_proxy='*'
# az login
echo "Remember to login an activate you role in the subscription you will work in. And provide a resource group name to check"
RG_GROUP="test-az-rg"
echo $RG_GROUP
echo "Resource group info"
RESULT_RG= az resource list --resource-group $RG_GROUP
echo "Virtual machine info"
RESULT_VM= az vm list --resource-group $RG_GROUP
echo "Disk info"
RESULT_DISK= az disk list --resource-group $RG_GROUP
