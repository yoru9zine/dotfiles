DIRS=$(shell find -maxdepth 1 -name '[^\.]*' -type d -printf '%f\n')

install: $(DIRS)
	stow --no-folding $(DIRS)

reinstall: $(DIRS)
	stow -R --no-folding $(DIRS)

.PHONY: install
