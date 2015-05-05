Enterprise Pharo (english version) [![Build Status](https://ci.inria.fr/pharo-contribution/buildStatus/icon?job=EnterprisePharoBook)](https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/) [![Build Status](https://travis-ci.org/SquareBracketAssociates/EnterprisePharoBook-english.svg?branch=master)](https://travis-ci.org/SquareBracketAssociates/EnterprisePharoBook-english)
====================
This book is continuously built on an [Inria Jenkins server](https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/).


How to write a book
-------------------

This book is written in Pillar markup. If you are not familiar with it please check the [pillar-documentation](https://github.com/pillar-markup/pillar-documentation).

###Generating the book

First of all you have to run `./download.sh` to obtain the Pillar executable that does all the job.

To generate your book execute `./compile.sh`. If you want to generate only one chapter, pass the file's path to the script: `./compile.sh Example/Example.pillar`. If you have `lualatex` installed and available in your system's `PATH`, the script will also generate pdf files.

###Adding a chapter

To add a chapter create a directory for it (named, e.g., `Example`) and put there a `.pillar` file (named, e.g., `Example.pillar`) which will contain the chapter itself. Put images in the `figures` subdirectory of the new chapter directory.

Add your chapter to:

* `pillar.conf` in the `inputFiles` array as: `"Example/Example.pillar"`, and
* `support/templates/book.latex.template` in `\graphicspath` as `{Example/}`

###Caveats

* You must neither use spaces nor underscores (`_`) in file names.

Tools
-----
There are mods/bundles/packages for text editors, that provide improvements for pillar files editing:

* Emacs: [pillar-mode](https://github.com/pillar-markup/pillar-mode)
* Vim: [vim-pillar](https://github.com/cdlm/vim-pillar)
* TextMate: [Pillar.tmbundle](https://github.com/pillar-markup/Pillar.tmbundle)
* ATOM: [language-pillar](https://github.com/pillar-markup/language-pillar)
