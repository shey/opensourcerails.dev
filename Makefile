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

