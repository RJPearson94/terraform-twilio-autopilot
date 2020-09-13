TEST_DIR=test

download: 
	@echo "==> Download Test dependencies"
	./$(TEST_DIR) go mod vendor

fmt:
	@echo "==> Format Terraform Code"
	terraform fmt -recursive

testacc: fmt
	cd $(TEST_DIR) && go test -timeout 10m

tools:
	@echo "==> installing required tooling..."
	GO111MODULE=off" go get github.com/segmentio/terraform-docs@v0.9.1

.PHONY: download fmt tools testacc