all: build_page 

build_page: tutorial-slide
	mdpage -t index.tp -o index.html

tutorial-slide: 
	asciidoc -b deckjs tutorial-slide.asciidoc
	asciidoc -b deckjs example-template.asciidoc

install-deckjs:
	rm -rf deck.js
	wget https://github.com/downloads/houqp/asciidoc-deckjs/deck.js.extended.zip
	unzip deck.js.extended.zip
	rm deck.js.extended.zip

check:
	git checkout master README.md
	#git checkout master deckjs.conf
	git checkout master tutorial-slide.asciidoc
	git checkout master example-template.asciidoc

clean: 
	rm -rf *.html 

.PHONY: all clean example

