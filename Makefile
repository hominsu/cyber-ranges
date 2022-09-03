REPO=hominsu
AUTHOR_NAME=hominsu
AUTHOR_EMAIL=hominsu@foxmail.com

IMG_RELATIVE_PATH=$(shell a=`basename $$PWD` && cd .. && b=`basename $$PWD` && cd .. && c=`basename $$PWD` && echo $$c/$$b)

DOCKER_IMAGE=$(REPO)/$(shell echo $(APP_NAME) |awk -F '@' '{print $$0 ":$(IMG_TAG)"}')

.PHONY: sqli-labs
# build sqli-labs images for current platform via docker
sqli-labs:
	docker build \
	--build-arg AUTHOR_NAME=$(AUTHOR_NAME) \
	--build-arg AUTHOR_EMAIL=$(AUTHOR_EMAIL) \
	--file Dockerfile \
	--tag $(DOCKER_IMAGE) .

# show help
help:
	@echo ''
	@echo 'Usage:'
	@echo ' make [target]'
	@echo ''
	@echo 'Targets:'
	@awk '/^[a-zA-Z\-\_0-9]+:/ { \
	helpMessage = match(lastLine, /^# (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")-1); \
			helpMessage = substr(lastLine, RSTART + 2, RLENGTH); \
			printf "\033[36m%-22s\033[0m %s\n", helpCommand,helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help