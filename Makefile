CWD := $(shell pwd)

.PHONY: all
all: clean build

.PHONY: start
start: deps clean
	@bundle exec jekyll serve --verbose

.PHONY: build
build: deps clean
	-@rm -rf docs &>/dev/null || true
	@bundle exec jekyll build --verbose
	@echo ::: BUILD :::

.PHONY: install
install: deps
	-@rm -f Gemfile.lock &>/dev/null || true
	@bundle install
	@echo ::: INSTALL :::

.PHONY: clean
clean:
	-@rm -rf _site &>/dev/null || true
	@echo ::: CLEAN :::

.PHONY: deps
deps: bundle
	@echo ::: DEPS :::
.PHONY: bundle
bundle:
	@if ! o=$$(which bundle); then gem install bundle jekyll; fi
