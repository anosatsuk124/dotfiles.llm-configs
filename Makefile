DHALL_YAML := dhall-to-yaml-ng
DHALL_TEXT := "dhall text"

SRC_MD := $(wildcard *.md.dhall)
SRC_YAML := $(wildcard *.yaml.dhall) $(wildcard *.yml.dhall)

.PHONY: all
all: build-markdown build-yaml

.PHONY: init
init: ./hooks/pre-commit
	@echo "Initializing project..."
	ln -s $(realpath ./hooks/pre-commit) ./.git/hooks/pre-commit

build-markdown: $(SRC_MD)
	@echo "Building markdown..."
	@for file in $(SRC_MD); do bash ./build.sh $(DHALL_TEXT) $$file; done

build-yaml: $(SRC_YAML)
	@echo "Building yaml..."
	@for file in $(SRC_YAML); do bash ./build.sh $(DHALL_YAML) $$file; done
