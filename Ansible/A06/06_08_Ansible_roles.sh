#Ansible Roles

#Roles let you automatically load related vars, files, tasks, handlers, and other 
#Ansible artifacts based on a known file structure. After you group your content in roles, 
#you can easily reuse them and share them with other users.

mkdir roles
mkdir roles/apache
mkdir roles/apache/tasks
mkdir roles/apache/handlers

cd roles/apache/handlers

vim main.yml

---

- name: start debian service
  service: name=apache2 enabled=yes state=started
  when: ansible_os_family == "Debian"

- name: start centos service
  service: name=httpd enabled=yes state=started
  when: ansible_os_family == "RedHat"

cd roles/apache/tasks

vim main.yml

---

- name: install on debian
  apt: name=apache2 update_cache=yes state=latest
  when: ansible_os_family == "Debian"
  notify: start debian service

- name: install on centos
  yum: name=httpd state=latest
  when: ansible_os_family == "RedHat"
  notify: start centos service

cd

vim site.yml

---

- name: site install
  hosts: server
  become: true
  roles:
   - apache


ansible-playbook site.yml