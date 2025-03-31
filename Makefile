DHALL_YAML := dhall-to-yaml-ng
DHALL_TEXT := "dhall text"

SRC_MD := $(wildcard *.md.dhall)
SRC_YAML := $(wildcard *.yml.dhall)
DIST_DIR := ./

.PHONY: all
all: build-markdown build-yaml

$(DIST_DIR):
	@mkdir -p $(DIST_DIR)

build-markdown: $(SRC_MD) $(DIST_DIR)
	@echo "Building markdown..."
	@for file in $(SRC_MD); do bash ./build.sh $(DHALL_TEXT) $$file $(DIST_DIR); done

build-yaml: $(SRC_YAML) $(DIST_DIR)
	@echo "Building yaml..."
	@for file in $(SRC_YAML); do bash ./build.sh $(DHALL_YAML) $$file $(DIST_DIR); done
