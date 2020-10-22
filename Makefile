default: build
.PHONY: build

build:
	ansible-playbook generate_secrets.yml -e env_name=$(ENVIRONMENT_NAME)
