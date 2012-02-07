all:
	@echo "* issue make test to test the backend."
	@echo "* issue make install to install deck.js dependence."

test:
	asciidoc --conf-file deckjs.conf example-template.asciidoc

install:
	rm -rf ./deck.js
	curl --location https://github.com/imakewebthings/deck.js/zipball/stable 2> /dev/null > deck.js.zip
	unzip deck.js.zip
	mv imakewebthings-deck.js-* deck.js

clean: 
	rm -rf example-template.html
	rm -rf deck.js.zip deck.js

.PHONY: all clean test 

