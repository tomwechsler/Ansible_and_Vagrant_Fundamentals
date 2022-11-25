ansible -m ping all

#Now edit /etc/ansible/hosts list (with a group 'Server' and 'Client')

ansible -m ping all

ansible -m raw -a '/usr/bin/uptime' all

ansible -m shell -a 'python -V' all

ansible -m shell -a 'python -V' server

ansible -m shell -a 'python -V' client