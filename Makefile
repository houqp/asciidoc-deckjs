package = asciidoc-deckjs
version = 1.1
tarname = $(package)
distdir = $(tarname)-$(version)

all:
	@echo "* issue make test to test the backend."
	@echo "* issue make install to install deck.js dependence."

test:
	asciidoc --conf-file deckjs.conf example-template.asciidoc

#install:ins-deckjs ins-deckextjs
install:
	wget https://github.com/downloads/houqp/asciidoc-deckjs/deck.js.extended.zip
	unzip deck.js.extended.zip
	rm deck.js.extended.zip

built-deckjs:ins-deckjs ins-deckextjs

pac-deckjs:built-deckjs
	zip -r deck.js.extended.zip deck.js

ins-deckextjs:
	curl --location https://github.com/barraq/deck.ext.js/zipball/master 2> /dev/null > deck.ext.js.zip
	unzip deck.ext.js.zip
	rm deck.ext.js.zip
	mv barraq-deck.ext.js-* deckextjs
	mv deckextjs/extensions/toc deck.js/extensions/
	mv deckextjs/themes/style/* deck.js/themes/style/
	mv deckextjs/themes/transition/* deck.js/themes/transition/
	rm -rf deckextjs

ins-deckjs:
	rm -rf ./deck.js
	curl --location https://github.com/imakewebthings/deck.js/zipball/stable 2> /dev/null > deck.js.zip
	unzip deck.js.zip
	rm deck.js.zip
	mv imakewebthings-deck.js-* deck.js

dist:$(distdir).zip

$(distdir).zip:$(distdir)
	zip -r $@ $(distdir)
	rm -rf $(distdir)

$(distdir):built-deckjs
	mkdir -p $(distdir)/example
	cp -r ad-stylesheet $(distdir)
	cp Makefile $(distdir)
	cp GPL-license.txt $(distdir)
	cp deckjs.conf $(distdir)
	cp example-template.asciidoc $(distdir)/example
	cp tutorial-slide.asciidoc $(distdir)/example
	cp README.md $(distdir)
	cp -r deck.js $(distdir)

clean: 
	rm -rf example-template.html
	rm -rf deck.js.zip deck.js
	rm -rf deck.ext.js.zip deckextjs
	rm -rf deck.js.extended.zip
	rm -rf $(distdir)

.PHONY: all clean test dist

