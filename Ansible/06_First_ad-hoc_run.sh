#Test the created inventory list
ansible all -m setup -a "filter=*family*"