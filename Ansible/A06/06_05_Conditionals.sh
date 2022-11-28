#Conditionals

ansible centos -b -m yum -a 'name=httpd state=absent'

ansible ubuntu -b -m apt -a 'name=apache2 state=absent'

#vim cond.yaml

---

- name: conditionals
  hosts: server
  become: yes
  
  tasks:
   - name: install apache2
     apt: name=apache2 update_cache=yes state=latest
     ignore_errors: yes

   - name: install httpd
     yum: name=httpd state=latest
     ignore_errors: yes


ansible-playbook cond.yaml

#Or so that no error messages appear

#vim cond.yaml

---

- name: conditionals
  hosts: server
  become: yes
  
  tasks:
   - name: install apache2
     apt: name=apache2 update_cache=yes state=latest
	   when: ansible_os_family == "Debian"

   - name: install httpd
     yum: name=httpd state=latest
	   when: ansible_os_family == "RedHat"


ansible-playbook cond.yaml

#Uninstall the web server:

#vim cond.yaml

---

- name: conditionals
- hosts: server
  become: yes
  
  tasks:
   - name: install apache2
     apt: name=apache2 update_cache=yes state=absent
	   when: ansible_os_family == "Debian"

   - name: install httpd
     yum: name=httpd state=absent
	   when: ansible_os_family == "RedHat"


ansible-playbook cond.yaml