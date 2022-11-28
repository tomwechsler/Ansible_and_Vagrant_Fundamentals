#A playbook always has a .yml or .yaml (YAML Ain't Markup Language) extension.
#Important, the syntax with the spaces must be followed.
#Establish SSH session to a server for later control!

vim play.yaml

---

- name: play
- hosts: server
  tasks:
   - name: the command uname
     shell: uname -a > /home/vagrant/result.txt

   - name: whoami
     shell: whoami >> /home/vagrant/result.txt

#Exit and save

#Let's check the playbook

ansible-playbook play.yaml --syntax-check

ansible-playbook -C -v play.yaml


ansible-playbook play.yaml

#No output from the playbook but the text file was created (but not as root). We can do it like this

ansible-playbook -b play.yaml

#This is also possible

vim play.yaml

---

- name: play
  hosts: server
  become: yes
  tasks:
   - name: the command uname
     shell: uname -a > /home/vagrant/result.txt

   - name: whoami
     shell: whoami >> /home/vagrant/result.txt

#Exit and save

ansible-playbook play.yaml

#Or in this way

vim play.yaml

---

- name: play
  hosts: server
  become: yes
  tasks:
   - name: the uname command
     shell: uname

   - name: whoami
     shell: whoami

#Exit and save (the output is not clear but this way errors can be detected)

ansible-playbook -v play.yaml