#Command module
- does not use the shell (BASH/SH)
- Pipe and redirect do not work

#Module Shell
- Supports pipe and redirect
- Attention: wrong commands can affect the whole system

#Module raw
- sends commands via ssh
- python is not needed

#Establish SSH session to a server

#No text file available because module command does not support redirect
ansible server -b -m command -a 'echo "test" > /root/test.txt'

#No it works
ansible server -b -m shell -a 'echo "test" > /root/test.txt'

#Another test
ansible server -b -m raw -a 'echo "test_again" >> /root/test.txt'

#Let's run twice => first output in yellow second in green! We use the file module
ansible server -b -m file -a 'path=/root/test.txt state=absent'

#Two times => first output in yellow. We use the copy module
ansible server -b -m copy -a 'src=/home/vagrant/file1.txt dest=/home/vagrant/file1.txt'

#Remove the file with the file module
ansible server -b -m file -a 'path=/home/vagrant/file1.txt state=absent'