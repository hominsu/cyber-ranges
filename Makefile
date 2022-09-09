# check whether platform is empty
ifneq ($(MAKECMDGOALS),help)
ifeq (${PLATFORM},)
$(error PLATFORM is undefined or empty. Using command [make help] to get more information)
endif
endif

.PHONY: pikachu
# build pikachu
pikachu:
	docker buildx bake --file docker-bake.hcl --load --set "*.platform=linux/${PLATFORM}" pikachu

.PHONY: sqli-labs
# build sqli-labs
sqli-labs:
	docker buildx bake --file docker-bake.hcl --load --set "*.platform=linux/${PLATFORM}" sqli-labs

.PHONY: xss-labs
# build xss-labs
xss-labs:
	docker buildx bake --file docker-bake.hcl --load --set "*.platform=linux/${PLATFORM}" xss-labs

.PHONY: all
# build all images
all:
	docker buildx bake --file docker-bake.hcl --load --set "*.platform=linux/${PLATFORM}"

PLATFORM_INFO="arm64 arm amd64 386"

# show help
help:
	@echo ''
	@echo 'Usage:'
	@echo ' PLATFORM=[platform] make [target]'
	@echo ''
	@echo 'Platforms:'
	@echo $(PLATFORM_INFO) | awk 'BEGIN{RS=" "}{ printf "\033[36m%-22s\033[0m \n",$$0; }'
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