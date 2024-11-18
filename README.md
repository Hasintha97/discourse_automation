Discourse Application Installation steps:

(01) Fresh ubuntu vm need for this application setup

Requirement : 2 vCPU , 8 Memory, Ubuntu 22.04 LTS

(02) Install the python and ansible . Please execute the commands in ansible-playbook.txt file one by one.

(03) Install the discourse dependencies

* Discourse dependencies insatallation related ansible tasks and vars are defined in the below locations.

-- task : roles/dependencies/task/main.yml
-- vars : roles/dependencies/vars/main.yml ( Change the variable acording to your requirements )

* Use the below command for Install the discourse dependencies using ansible playbook

ansible-playbook dependencies-playbook.yml -i inventory.ini --become -v

If you need run the specific tags in the tasks/main.yml file use the below command (--tags <tag_name>)

ansible-playbook dependencies-playbook.yml -i inventory.ini --become --tags rbenv  -v

(04) After completed 3rd Process then need to bootstrap the discourse. bootstrap related ansible tasks and vars are defined in the below locations.

-- task : roles/bootstrap/task/main.yml
-- vars : roles/bootstrap/vars/main.yml  ( Change the variable acording to your requirements )

* Use the below command for bootstrap the discourse using ansible playbook.

ansible-playbook bootstrap-playbook.yml -i inventory.ini --become -v

(05) After successfully completing the above steps, finally you can start the discourse application using the below command. Before running the command, change the variable inside the start. sh file according to your requirement.

sh start.sh

(06) You can stop the application using below command

sh stop.sh

