#Variables and facts

vim facts.yaml

---

- name: facts
  hosts: centos
  vars:
  - var1: thats great
  - var2: is even better
  
  tasks:
   - name: echo stuff
     shell: echo " {{ var1 }} is var1, but var2 {{ var2 }}" > /home/vagrant/facts.txt


ansible-playbook facts.yaml

#Now we have worked with the first variables. Now imagine if we can create the variables based on facts. 
#The following example:

ansible centos -m setup

ansible centos -m setup -a "filter=*family*"

#and now the following adjustment in the playbook

vim facts.yaml

---

- name: facts
  hosts: centos
  vars:
  - var1: thats great
  - var2: is even better
  
  tasks:
   - name: echo stuff
     shell: echo " {{ var1 }} var1, but var2 {{ var2 }}" > /home/vagrant/{{ ansible_os_family }}.txt

ansible-playbook facts.yaml

#If you want ignore facts use gather_facts: false under hosts