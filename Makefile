all: build_page 

build_page: example
	mdpage -t index.tp -o index.html

example: 
	asciidoc -f deckjs.conf example.asciidoc

clean: 
	rm -rf *.html 

.PHONY: all clean example

