ansible -m ping all

#To change the inventoy /etc/ansible/hosts list (with a group 'server' and 'client')

ansible -m ping all

ansible -m raw -a '/usr/bin/uptime' all

ansible -m shell -a 'python -V' all

ansible -m shell -a 'python -V' server

ansible -m shell -a 'python -V' client