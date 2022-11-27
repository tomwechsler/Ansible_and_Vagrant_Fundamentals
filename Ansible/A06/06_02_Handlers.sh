#Handlers
#Handlers can be used to start an action after a task. However, if no change is made with the task, the handler is not called. 
#Let's look at this with an example.

vim handlers.yaml

---

- name: handlers
- hosts: server
  become: yes
  tasks:
   - name: install vsftpd on ubuntu
     apt: name=vsftpd update_cache=yes state=latest
	 ignore_errors: yes
	 notify: start vsftpd
   
   - name: install vsftpd on centos
     yum: name=vsftpd state=latest
	 ignore_errors: yes
	 notify: start vsftpd

  handlers:
   - name: start vsftpd
     service: name=vsftpd enabled=yes state=started


ansible-playbook handlers.yaml

#Make note that the handler has been executed. When the playbook is started again, 
#the handler will not be called again because there was no change.