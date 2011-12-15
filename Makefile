all: test

test:
	asciidoc --conf-file deckjs.conf example.asciidoc

install:
	git submodule init

clean: 
	rm -rf example.html

.PHONY: all clean

