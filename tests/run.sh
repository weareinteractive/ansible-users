#!/bin/bash

# define variables
ROLE_NAME=franklinkim.users

# install dependencies
apt-get install -y openssh-client openssh-server
#ansible-galaxy install franklinkim.openssl

# create role symnlink
ln -s $(pwd) /usr/share/ansible/roles/$ROLE_NAME

echo 'running playbook'
ansible-playbook -vvvv -i 'localhost,' -c local $(pwd)/tests/main.yml
