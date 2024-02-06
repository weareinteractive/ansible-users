PWD=$(shell pwd)
ROLE_NAME=weareinteractive.users
ROLE_PATH=/etc/ansible/roles/$(ROLE_NAME)
TEST_VERSION=ansible --version
TEST_SYNTAX=ansible-playbook -v -i 'localhost,' -c local $(ROLE_PATH)/tests/main.yml --syntax-check
TEST_PLAYBOOK=ansible-playbook -v -i 'localhost,' -c local $(ROLE_PATH)/tests/main.yml
TEST_IDEMPOTENT=$(TEST_PLAYBOOK) | grep -q 'failed=0' && (echo 'Idempotence test: pass' && exit 0) || (echo 'Idempotence test: fail' && exit 1)
TEST_CMD=$(TEST_VERSION); $(TEST_DEPS); $(TEST_SYNTAX); $(TEST_PLAYBOOK); $(TEST_IDEMPOTENT)

docs:
	ansible-role docgen

lint:
	ansible-lint .

ubuntu%: TEST_DEPS=apt-get update && \
	apt-get install -y python openssh-client

ubuntu22.04: dist=ubuntu-22.04
ubuntu22.04: .run

ubuntu20.04: dist=ubuntu-20.04
ubuntu20.04: .run

ubuntu18.04: dist=ubuntu-18.04
ubuntu18.04: .run

ubuntu16.04: dist=ubuntu-16.04
ubuntu16.04: .run

debian%: TEST_DEPS=apt-get update && \
	apt-get install -y openssh-client

debian11: dist=debian-11
debian11: .run

debian10: dist=debian-10
debian10: .run

debian9: dist=debian-9
debian9: .run

debian8: dist=debian-8
debian8: .run

.run:
	@echo "RUN:"
	@echo "	docker run -it --rm -v $(PWD):$(ROLE_PATH) ansiblecheck/ansiblecheck:$(dist) /bin/bash"
	@echo "	$(TEST_CMD)"
	@docker run -it --rm -v $(PWD):$(ROLE_PATH) ansiblecheck/ansiblecheck:$(dist) /bin/bash -c "$(TEST_CMD)"
