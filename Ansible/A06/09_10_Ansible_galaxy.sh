#Ansible Galaxy


https://galaxy.ansible.com/

#The templates which are downloaded from Galaxy are in the directory:

ls /etc/ansible/roles

ansible-galaxy search freeipa

#Attention when choosing, make sure that the template supports your distribution.

sudo ansible-galaxy install yabhinav.ipaserver

ls /etc/ansible/roles

#vim ipa.yaml

---

- name: ipa server
- hosts: server
  become: yes
  roles:
   - yabhinav.ipaserver