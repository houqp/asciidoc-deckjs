Asciidoc-deck.js
================

A Deck.js backend for asciidoc. 


Dependencies
------------

* AsciiDoc
* Deck.js

Optional:

* If you want to highlight source code, please install Pygments or source-highlight.


Installation
------------

If you don't have deck.js you can download it automatically with `make install`. Or you can get it manually from its official [link](https://github.com/imakewebthings/deck.js/zipball/stable), and rename the unzipped directory to `deck.js`.

The second thing you need to do is to make sure your asciidoc can properly find `deckjs.conf`. For asciidoc's configuration file loading strategy, please refer to [this guide](http://www.methods.co.nz/asciidoc/userguide.html#X7).

The easiest way is to put `deckjs.conf` and the asciidoc file you wrote in the same directory.


Usage
-----

```bash
asciidoc -f deck.js.conf file.asciidoc
```

file.asciidoc is the asciidoc file you wrote. 

Remember to put `deck.js` and generated slide into the same directory.


