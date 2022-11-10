#One way - not recommended
mkdir ~/.Azure
vim ~/.azure/credentials

#In vim
#Credentials File Contents
[default]
subscription_id=<id>
client_id=<id>
secret=<secret>
tenant=<id>

#Pass Environment Variables
export AZURE_SUBSCRIPTION_ID=<id>
export AZURE_CLIENT_ID=<id>
export AZURE_SECRET=<id>
export AZURE_TENANT=<id>