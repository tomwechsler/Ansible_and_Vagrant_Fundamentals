ansible_connection=local ansible localhost -m setup

ansible_connection=local ansible localhost -m setup \-a "filter=ansible_os_family" 
"ansible_os_family": "RedHat"



Plays have a default task to Gather Facts about the target node. This can be disabled if not
required. We can use the setup module from the command line to print facts and filter to drill
down to the detail we need.



