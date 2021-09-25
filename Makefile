all: bin/server
test: unit-test

PLATFORM=local

.PHONY: bin/server
bin/server:
	@docker build . --target bin \
	--output bin/ \
	--platform ${PLATFORM}

.PHONY: unit-test
unit-test:
	@docker build . --target unit-test

.PHONY: lint
lint:
	@docker build . --target lint
