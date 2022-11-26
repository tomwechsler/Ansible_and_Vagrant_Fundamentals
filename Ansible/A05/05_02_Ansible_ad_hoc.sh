#Without specifying the module, the module "command" is always used!

#Was executed without elevated privileges
ansible all -a 'uptime' 

#Also the module "command" was used automatically
ansible all -a 'whoami'

#-b stands for "become" so become root
ansible all -b -a 'uptime' 

ansible all -a 'ls'

#We specify the module explicitly
ansible all -m command -a 'blkid'

#To become root an set the module
ansible all -b -m command -a 'blkid'

#We use yum
ansible all -b -m yum -a 'name=httpd state=present'

#If not installed, if present then updated
ansible all -b -m yum -a 'name=httpd state=latest'

#Uninstall
ansible all -b -m yum -a 'name=httpd state=absent'

#We use the service module to enbale the service
ansible all -b -m service -a 'name=httpd enabled=true'

#Now we start the service
ansible all -b -m service -a 'name=httpd state=started'