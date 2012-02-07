package = asciidoc-deckjs
version = 1.0
tarname = $(package)
distdir = $(tarname)-$(version)

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
	rm deck.js.zip

dist:$(distdir).zip

$(distdir).zip:$(distdir)
	zip -r $@ $(distdir)
	rm -rf $(distdir)

$(distdir):
	mkdir -p $(distdir)/example
	cp -r ad-stylesheet $(distdir)
	cp Makefile $(distdir)
	cp GPL-license.txt $(distdir)
	cp deckjs.conf $(distdir)
	cp example-template.asciidoc $(distdir)/example
	cp tutorial-slide.asciidoc $(distdir)/example
	cp README.md $(distdir)

clean: 
	rm -rf example-template.html
	rm -rf deck.js.zip deck.js
	rm -rf $(distdir)

.PHONY: all clean test dist

