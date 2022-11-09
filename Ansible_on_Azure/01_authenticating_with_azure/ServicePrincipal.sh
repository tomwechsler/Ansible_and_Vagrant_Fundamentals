#Create Service Principal using the Azure CLI
az ad sp create-for-rbac --name <Service Principal name>

#IMPORTANT, save the app secret. It will not be visible again

#Assign Service Principal a role
az role assignment create --assignee <Service Principal app ID> --role Contributor

#Display Tenant ID and Subscription IR
az account show --query '{tenantId:tenantId,subscriptionid:id}';

#Display Client ID
az ad sp list --display-name <Service Principal name> --query '{clientId:[0].appId}'
