all: build_page 

build_page: tutorial-slide
	mdpage -t index.tp -o index.html

tutorial-slide: 
	asciidoc -f deckjs.conf tutorial-slide.asciidoc

clean: 
	rm -rf *.html 

.PHONY: all clean example

