#!/bin/bash

# define variables
ROLE_NAME=franklinkim.users

# install dependencies
echo '* installing dependencies'
apt-get update
apt-get install -y openssh-client
#ansible-galaxy install franklinkim.openssl

# create role symlink
echo '* creating symlink'
ln -s $(pwd) /usr/share/ansible/roles/$ROLE_NAME

# run tests
echo 'running playbook'
ansible-playbook --syntax-check -i 'localhost,' -c local $(pwd)/tests/main.yml
ansible-playbook -vvvv -i 'localhost,' -c local $(pwd)/tests/main.yml
