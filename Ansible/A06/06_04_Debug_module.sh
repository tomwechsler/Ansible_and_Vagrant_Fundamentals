#Debug Module

#vim debug.yaml

---

- hosts: centos
  vars:
   - var_etwas: "Are you gonna"
  
  tasks:
   - name: Show the result
     debug: msg="the variable var_etwas is destined to - {{ var_etwas }}"


ansible-playbook debug.yaml

echo -e "hallo\nhallo linie 2\nhallo linie 3"

#Now we edit our playbook again. Modifying the playbook with "echo -e".

#vim debug.yaml

---

- hosts: centos
  vars:
   - var_etwas: "Are you gonna"
  
  tasks:
   - name: echo etwas
     command: echo -e "{{ var_etwas }} go my way,\n{{ var_etwas }} your way,\n{{ var_etwas }} the right way YEAH!!"
     register: results


   - name: Show the result
     debug: msg={{ results }}


ansible-playbook debug.yaml

#Adjust only the last line with .stdout_lines

#vim debug.yaml

---

- hosts: centos
  vars:
   - var_etwas: "Are you gonna"
  
  tasks:
   - name: echo etwas
     command: echo -e "{{ var_etwas }} go my way,\n{{ var_etwas }} your way,\n{{ var_etwas }} the right way YEAH!!"
     register: results


   - name: Show the result
     debug: msg={{ results.stdout_lines }}


ansible-playbook debug.yaml
