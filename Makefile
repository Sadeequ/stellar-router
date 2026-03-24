.PHONY: build test build-wasm check fmt clean help

build: ## Build all contracts (dev profile)
	cargo build

test: ## Run all tests
	cargo test

build-wasm: ## Build WASM artifacts (release profile)
	cargo build --target wasm32-unknown-unknown --release

check: ## Run cargo check and clippy
	cargo check
	cargo clippy -- -D warnings

fmt: ## Format all source code
	cargo fmt

clean: ## Remove build artifacts
	cargo clean

help: ## Print this help message
	@grep -E '^[a-zA-Z_-]+:.*##' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*##"}; {printf "  %-12s %s\n", $$1, $$2}'
