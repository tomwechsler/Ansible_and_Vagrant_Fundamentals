ansible_connection=local ansible localhost -m ping

find /usr/lib/python3.6/site-packages/ansible -name ping.py



Using the command ansible, we issue ad-hoc commands from the command line. This is great to
demonstrate the power of Ansible. Ansible must target nodes and reference a Python module.