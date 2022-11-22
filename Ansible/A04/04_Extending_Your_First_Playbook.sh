vim my.yml

ansible-playbook my.yml



We now have two tasks. A list item in YAML starts with the dash "-" Using the debug module we
can print data. Here we use Jinja to extract a variable from the collected facts.