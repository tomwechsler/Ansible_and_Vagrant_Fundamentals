#Ansible 2.9 with azure_rm module
ansible localhost -m azure_rm_resourcegroup -a "name=ansible-test location=westeurope"

#Write and run an Ansible playbook
---
- hosts: localhost
  connection: local
  tasks:
    - name: Creating resource group
      azure_rm_resourcegroup:
        name: "ansible-test"
        location: "westeurope"