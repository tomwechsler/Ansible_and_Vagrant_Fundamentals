vim my.yml

---

- name: simple play
  hosts: servers
  tasks:
    - name: ping me
	  ping:

ansible-playbook my.yml



A major component of Ansible is the playbook. The playbook is written in YAML and needs to
maintain the correct indentation level. Once written they are executed reliably on each
occasion.