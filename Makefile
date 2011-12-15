all: build_page

build_page:
	mdpage -t index.tp -o index.html

clean: 
	rm -rf *.html

.PHONY: all clean

