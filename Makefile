DIRS=$(shell find -maxdepth 1 -name '[^\.]*' -type d -printf '%f\n')

install: $(DIRS)
	stow $(DIRS)

.PHONY: install
