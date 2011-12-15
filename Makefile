all: build_page 

build_page: example
	mdpage -t index.tp -o index.html

example: 
	cd example/deck.js && git pull
	cd example && asciidoc -f ../deckjs.conf index.asciidoc

clean: 
	rm -rf example/*.html *.html

.PHONY: all clean example

