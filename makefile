TEST_DIR=test

download: 
	@echo "==> Download Test dependencies"
	cd ./$(TEST_DIR); go mod vendor

fmt:
	@echo "==> Format Terraform Code"
	terraform fmt -recursive

testacc: fmt
	cd $(TEST_DIR); go test -timeout 10m

.PHONY: download fmt tools testacc