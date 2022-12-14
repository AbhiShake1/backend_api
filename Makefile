.DEFAULT_GOAL:=help

.EXPORT_ALL_VARIABLES:

ifndef VERBOSE
.SILENT:
endif

# set default shell
SHELL=/usr/bin/env bash -o pipefail -o errexit

TAG ?= $(shell cat TAG)

help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: image
image:  ## Build backend_api image
	@build/image.sh

.PHONY: clean-image
clean-image:  ## Clean backend_api image
	@build/clean-image.sh

.PHONY: install
install:  ## Install backend_api with poetry
	@build/install.sh

.PHONY: metrics
metrics: install ## Run backend_api metrics checks
	@build/metrics.sh

.PHONY: unit-test
unit-test: install ## Run backend_api unit tests
	@build/unit-test.sh

.PHONY: integration-test
integration-test: install ## Run backend_api integration tests
	@build/integration-test.sh

.PHONY: docs
docs: install ## Build backend_api documentation
	@build/docs.sh

.PHONY: dev-env
dev-env: image ## Start a local Kubernetes cluster using minikube and deploy application
	@build/dev-env.sh

.PHONY: clean
clean: ## Remove .cache directory and cached minikube
	minikube delete && rm -rf ~/.cache ~/.minikube

.PHONY: show-version
show-version:
	echo -n $(TAG)
