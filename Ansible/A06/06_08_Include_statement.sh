#Include Statement

#To best understand what include statement means we first create two yaml files.

#vim apache.yaml

---

- name: install apache2
  apt: name=apache2 update_cache=yes state=latest
  when: ansible_os_family == "Debian"

- name: install httpd
  yum: name=httpd state=latest
  when: ansible_os_family == "RedHat"

- name: Dienst starten
  service: name=apache2 enabled=yes state=started
  when: ansible_os_family == "Debian"

- name: Dienst starten
  service: name=httpd enabled=yes state=started
  when: ansible_os_family == "RedHat"
  
#vim update.yaml

---

- name: update
- hosts: server
  become: yes
      
  tasks:
   - name: update mit apt
     apt: upgrade=dist update_cache=yes
	 when: ansible_os_family == "Debian"
	 
   - name: update mit apt
     yum: name=* state=latest update_cache=yes
	 when: ansible_os_family == "RedHat"


#vim include.yaml

---

- include: /home/vagrant/update.yaml

- name: include
- hosts: server
  become: yes
  tasks:
   - include: /home/vagrant/apache.yaml