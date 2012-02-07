all: test

test:
	asciidoc --conf-file deckjs.conf example-template.asciidoc

clean: 
	rm -rf example-template.html

.PHONY: all clean

