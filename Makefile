all: build_page 

build_page: tutorial-slide
	mdpage -t index.tp -o index.html

tutorial-slide: 
	asciidoc -f deckjs.conf tutorial-slide.asciidoc

install-deckjs:
	wget https://github.com/downloads/houqp/asciidoc-deckjs/deck.js.extended.zip
	unzip deck.js.extended.zip
	rm deck.js.extended.zip

clean: 
	rm -rf *.html 

.PHONY: all clean example

