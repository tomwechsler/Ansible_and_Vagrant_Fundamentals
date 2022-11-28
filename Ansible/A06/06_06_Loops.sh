#Loops

#Check the Ansible documentation on loops.

vim loops.yaml

---

- name: loops
  hosts: ubuntu
  become: yes
  
  tasks:
   - name: install packtes
     apt: name={{ item }} update_cache=yes state=latest
     with_items:
          - vim
          - nano
          - apache2


ansible-playbook loops.yaml

#Restart the playbook and there will be no change.
#Another example:

vim loops.yaml

---

- name: loops
  hosts: ubuntu
  become: yes
  
  tasks:
   - name: Zahlen 1-10
     debug: msg="das ist ein loop {{ item }}"
     with_sequence: start=1 end=10


ansible-playbook loops.yaml