package:= deckjs
version:= $(shell head -n 1 deckjs.conf | sed s/\#\ version\ //g)
tarname:= $(package)
distdir:= $(tarname)-$(version)

all:
	@echo -e "asciidoc-deckjs $(version)\n"
	@echo "* issue make test to test the backend."
	@echo "* issue make install-dep to install deck.js dependence."

test:
	asciidoc -b deckjs example-template.asciidoc
	asciidoc -b deckjs tutorial-slide.asciidoc

install-dep:
	wget https://github.com/downloads/houqp/asciidoc-deckjs/deck.js.extended.zip
	unzip deck.js.extended.zip
	rm deck.js.extended.zip

built-deckjs:ins-deckextjs ins-deckjsblank ins-deckjs

pac-deckjs:built-deckjs
	zip -r deck.js.extended.zip deck.js

ins-deckextjs:ins-deckjs
	curl --location https://github.com/barraq/deck.ext.js/zipball/master 2> /dev/null > deck.ext.js.zip
	unzip deck.ext.js.zip
	mv barraq-deck.ext.js-* deckextjs
	mv deckextjs/extensions/toc deck.js/extensions/
	mv deckextjs/themes/style/* deck.js/themes/style/
	mv deckextjs/themes/transition/* deck.js/themes/transition/
	rm -rf deckextjs

ins-deckjsblank:ins-deckjs
	curl --location https://github.com/mikek70/deck.js-blank/zipball/master 2> /dev/null > deck.js-blank.zip
	unzip deck.js-blank.zip
	mv mikek70-deck.js-blank-* deck.js/extensions/deck.js-blank

ins-deckjs:
	rm -rf ./deck.js
	curl --location https://github.com/imakewebthings/deck.js/zipball/stable 2> /dev/null > deck.js.zip
	unzip deck.js.zip
	rm deck.js.zip
	mv imakewebthings-deck.js-* deck.js

dist:$(distdir).zip

$(distdir).zip:$(distdir)
	asciidoc --backend build $@ $(distdir)
	rm -rf $(distdir)

$(distdir):built-deckjs
	mkdir -p $(distdir)/example
	cp -r ad-stylesheet $(distdir)
	cp GPL-license.txt $(distdir)
	cp deckjs.conf $(distdir)
	cp example-template.asciidoc $(distdir)/example
	cp tutorial-slide.asciidoc $(distdir)/example
	cp README.md $(distdir)
	cp -r deck.js $(distdir)

check:
	git checkout gh-pages README.md
	git checkout gh-pages tutorial-slide.asciidoc
	git checkout gh-pages example-template.asciidoc

clean: 
	rm -rf example-template.html
	rm -rf tutorial-slide.html
	rm -rf deck.js.zip deck.js
	rm -rf deck.ext.js.zip deckextjs
	rm -rf deck.js.extended.zip
	rm -rf $(distdir)
	rm -rf deckjs-*.zip
	rm -rf deck.js-blank.zip
	rm -rf deck.ext.js.zip

.PHONY: all clean test dist

