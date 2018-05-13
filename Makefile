PWD=$(shell pwd)
ROLE_NAME=franklinkim.users
ROLE_PATH=/etc/ansible/roles/$(ROLE_NAME)
TEST_VERSION=ansible --version
TEST_DEPS=apt-get update && apt-get install -y ssh
TEST_SYNTAX=ansible-playbook -v -i 'localhost,' -c local $(ROLE_PATH)/tests/main.yml --syntax-check
TEST_PLAYBOOK=ansible-playbook -vvvv -i 'localhost,' -c local $(ROLE_PATH)/tests/main.yml
TEST_CMD=$(TEST_DEPS); $(TEST_VERSION); $(TEST_SYNTAX); $(TEST_PLAYBOOK); $(TEST_PLAYBOOK)

ubuntu16.04: dist=ubuntu-16.04
ubuntu16.04: .run

ubuntu14.04: dist=ubuntu-14.04
ubuntu14.04: .run

debian9: dist=debian-9
debian9: .run

debian8: dist=debian-8
debian8: .run

.run:
	@echo "$(TEST_CMD)"
	@echo "docker run -it --rm -v $(PWD):$(ROLE_PATH) ansiblecheck/ansiblecheck:$(dist) /bin/bash"
	#@docker run -it --rm -v $(PWD):$(ROLE_PATH) ansiblecheck/ansiblecheck:$(dist) /bin/bash -c "$(TEST_CMD)"
