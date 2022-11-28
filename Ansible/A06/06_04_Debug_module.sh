#Debug Module

vim debug.yaml

---

- name: debug
  hosts: centos
  vars:
   - var_thing: "Are you gonna"
  
  tasks:
   - name: Show the result
     debug: msg="the variable var_thing is destined to - {{ var_thing }}"


ansible-playbook debug.yaml

echo -e "hallo\nhallo linie 2\nhallo linie 3"

#Now we edit our playbook again. Modifying the playbook with "echo -e".

vim debug.yaml

---

- name: debug
  hosts: centos
  vars:
   - var_thing: "Are you gonna"
  
  tasks:
   - name: echo thing
     command: echo -e "{{ var_thing }} go my way,\n{{ var_thing }} your way,\n{{ var_thing }} the right way YEAH!!"
     register: results


   - name: Show the result
     debug: msg={{ results }}


ansible-playbook debug.yaml

#Adjust only the last line with .stdout_lines

vim debug.yaml

---

- name: debug
  hosts: centos
  vars:
   - var_thing: "Are you gonna"
  
  tasks:
   - name: echo thing
     command: echo -e "{{ var_thing }} go my way,\n{{ var_thing }} your way,\n{{ var_thing }} the right way YEAH!!"
     register: results


   - name: Show the result
     debug: msg={{ results.stdout_lines }}


ansible-playbook debug.yaml
