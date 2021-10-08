BASEDIR					= $(shell pwd)
-include ${BASEDIR}/.env

PROJDIR					= ${BASEDIR}

DOCKER_IMAGE			= ${DOCKER_REGISTRY}/${DOCKER_USERNAME}/${PROJECT}

build: ## Build Docker Image.
	@docker build $(PROJDIR) --tag $(DOCKER_IMAGE)

push: ## Push Docker Image to Registry.
	@docker push $(DOCKER_IMAGE)$(DOCKER_IMAGE_TAG)

run:
	@docker run $(ARGS) $(DOCKER_IMAGE)

help: ## Show help and exit.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)