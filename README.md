Asciidoc-deck.js
================

An asciidoc backend for deck.js


Dependencies
------------

* AsciiDoc
* deck.js


Installation
------------

No need to install, just make sure asciidoc can properly find deck.js.conf. For asciidoc's configuration file loading strategy, please refer to [this guide](http://www.methods.co.nz/asciidoc/userguide.html#X7).

The easiest way is to put `deckjs.conf` and the asciidoc file you wrote in the same directory.

However, you can download `deckjs` by following command:
```bash
make isntall
```


Usage
-----

```bash
asciidoc -f deck.js.conf file.asciidoc
```
file.asciidoc is the asciidoc file you wrote. 


