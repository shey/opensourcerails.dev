.PHONY: help
.DEFAULT_GOAL := help

help: ## Displays this help message.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: deploy
deploy: ## Deploy the app to the 'staging' environment
	bundle exec cap staging deploy

.PHONY: prod-deploy
prod-deploy: ## Deploy the app to the 'production' environment
	BRANCH=main bundle exec cap production deploy

.PHONY: deploy-branch-to-staging
deploy-branch-to-staging: ## Using the current Git branch, deploy the app to the 'staging' environment
	BRANCH=$(shell git rev-parse --abbrev-ref HEAD) bundle exec cap staging deploy

.PHONY: local-db-dump
local-db-dump: ## Dump the local database to a file
	bundle exec rake db:dump

.PHONY: purge
purge: ## Run all the bin/rails commands to clean up - useful for debugging
	@echo "Cleaning up Rails assets..."
	@bin/rails assets:clobber
	@echo "Cleaning up all temporary files..."
	@bin/rails tmp:clear
	@echo "Clearing Rails logs..."
	@bin/rails log:clear
	@echo "Clearing cache files..."
	@bin/rails tmp:cache:clear
	@echo "Cleanup complete!"
