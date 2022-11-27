#Test the created inventory list
ansible all -a ping

ansible all -m setup -a "filter=*family*"