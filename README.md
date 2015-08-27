Enterprise Pharo (english version) [![Build Status](https://ci.inria.fr/pharo-contribution/buildStatus/icon?job=EnterprisePharoBook)](https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/) [![Build Status](https://travis-ci.org/SquareBracketAssociates/EnterprisePharo.svg?branch=master)](https://travis-ci.org/SquareBracketAssociates/EnterprisePharo)
====================

How to write a book
-------------------

This book is written in Pillar markup. If you are not familiar with it please check the [pillar-documentation](https://github.com/pillar-markup/pillar-documentation).

###Generating the book

First of all you have to run `./download.sh` to obtain the Pillar executable that does all the job.

To generate your book execute `./pillar export` then `bash pillarPostExport.sh` or simply `./compile.sh`. If you want to generate only one chapter run `./pillar export Example/Example.pillar` then `bash pillarPostExport.sh`. If you have `lualatex` installed and available in your system's `PATH`, the script will also generate pdf files.

###Adding a chapter

To add a chapter create a directory for it (named, e.g., `Example`) and put there a `.pillar` file (named, e.g., `Example.pillar`) which will contain the chapter itself. Put images in the `figures` subdirectory of the new chapter directory.

Add your chapter to:

* `pillar.conf` in the `inputFiles` array as: `"Example/Example.pillar"`
* `support/latex/book.tex` in `\graphicspath` as `{Example/}`
* `EnterprisePharo.pillar` as `${inputFile:Example/Example.pillar}$`

###Caveats

* You must neither use spaces nor underscores (`_`) in file names.

#### Chapters

Chapter | Latest | Link reference |
:-------|:-------|:----------------
1 - [Teapot](Teapot/) | [html](https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/Teapot/Teapot.html) [pdf](https://ci.inria.fr/pharo-contribution/view/Books/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/Teapot/Teapot.pdf) | `Chapter *@cha:teapot*` link: `*Teapot>../Teapot/Teapot.pillar@cha:teapot*`
2 - [Handling CSV with NeoCSV](NeoCSV) | [html](https://ci.inria.fr/pharo-contribution/view/Books/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/NeoCSV/NeoCSV.html) [pdf](https://ci.inria.fr/pharo-contribution/view/Books/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/NeoCSV/NeoCSV.pdf) | `Chapter *@cha:neoCSV*` link: `*NeoCSV>../NeoCSV/NeoCSV.pier@cha:neoCSV*`
3 - [JSON](NeoJSON/) | [html](https://ci.inria.fr/pharo-contribution/view/Books/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/NeoJSON/NeoJSON.html) [pdf](https://ci.inria.fr/pharo-contribution/view/Books/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/NeoJSON/NeoJSON.pdf) | `Chapter *@cha:JSON*` link: `*JSON>../NeoJSON/NeoJSON.pier@cha:JSON*`
4 - [STON: a Smalltalk Object Notation](STON/) | [html](https://ci.inria.fr/pharo-contribution/view/Books/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/STON/STON.html) [pdf](https://ci.inria.fr/pharo-contribution/view/Books/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/STON/STON.pdf) | `Chapter *@cha:ston*` link: `*STON>../STON/STON.pillar@cha:ston*`
5 - [Serializing Complex Objects with Fuel](Fuel/) | [html](https://ci.inria.fr/pharo-contribution/view/Books/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/Fuel/Fuel.html) [pdf](https://ci.inria.fr/pharo-contribution/view/Books/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/Fuel/Fuel.pdf) | `Chapter *@cha:fuel*` link: `*Fuel>../Fuel/Fuel.pillar@cha:fuel*`
6 - [Persisting Objects with Voyage](Voyage/) | [html](https://ci.inria.fr/pharo-contribution/view/Books/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/Voyage/Voyage.html) [pdf](https://ci.inria.fr/pharo-contribution/view/Books/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/Voyage/Voyage.pdf) | `Chapter *@cha:voyage*` link: `*Voyage>../Voyage/Voyage.pier@cha:voyage*`
7 - [Mustache Templates for Pharo](Mustache/) | [html](https://ci.inria.fr/pharo-contribution/view/Books/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/Mustache/Mustache.html) [pdf](https://ci.inria.fr/pharo-contribution/view/Books/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/Mustache/Mustache.pdf) | `Chapter *@cha:mustache*` link: `*Mustache>../Mustache/Mustache.pillar@cha:mustache*`
8 - [Cascading Style Sheets with RenoirSt](RenoirST/) | [html](https://ci.inria.fr/pharo-contribution/view/Books/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/RenoirST/RenoirST.html) [pdf](https://ci.inria.fr/pharo-contribution/view/Books/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/RenoirST/RenoirST.pdf) | `Chapter *@cha:renoirst*` link: `*RenoirST>../RenoirST/RenoirST.pier@cha:renoirst*`
9 - [Documenting your Project with Pillar](PillarChap/) | [html](https://ci.inria.fr/pharo-contribution/view/Books/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/PillarChap/Pillar.html) [pdf](https://ci.inria.fr/pharo-contribution/view/Books/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/PillarChap/Pillar.pdf) | `Chapter *@cha:pillar*` link: `*Pillar>../PillarChap/Pillar.pillar@cha:pillar*`
10 - [Generate PDF documents with Artefact](Artefact/) | [html](https://ci.inria.fr/pharo-contribution/view/Books/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/Artefact/Artefact.html) [pdf](https://ci.inria.fr/pharo-contribution/view/Books/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/Artefact/Artefact.pdf) | `Chapter *@cha:artefact*` link: `*Artefact>../Artefact/Artefact.pillar@cha:artefact*`
11 - [Character Encoding and Resource Meta Description](Zinc-Encoding-Meta/) | [html](https://ci.inria.fr/pharo-contribution/view/Books/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/Zinc-Encoding-Meta/Zinc-Encoding-Meta.html) [pdf](https://ci.inria.fr/pharo-contribution/view/Books/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/Zinc-Encoding-Meta/Zinc-Encoding-Meta.pdf) | `Chapter *@cha:zincEncoding*` link: `*Zinc Encoding Meta>../Zinc-Encoding-Meta/Zinc-Encoding-Meta.pillar@cha:zincEncoding*`
12 - [Zinc HTTP: The Client-side](Zinc-HTTP-Client/) | [html](https://ci.inria.fr/pharo-contribution/view/Books/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/Zinc-HTTP-Client/Zinc-HTTP-Client.html) [pdf](https://ci.inria.fr/pharo-contribution/view/Books/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/Zinc-HTTP-Client/Zinc-HTTP-Client.pdf) | `Chapter *@cha:zinc-client*` link: `*Zinc Client>../Zinc-HTTP-Client/Zinc-HTTP-Client.pillar@cha:zinc-client*`
13 - [Zinc HTTP: The server side](Zinc-HTTP-Server/) | [html](https://ci.inria.fr/pharo-contribution/view/Books/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/Zinc-HTTP-Server/Zinc-HTTP-Server.html) [pdf](https://ci.inria.fr/pharo-contribution/view/Books/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/Zinc-HTTP-Server/Zinc-HTTP-Server.pdf) | `Chapter *@cha:zinc-server*` link: `*Zinc Server>../Zinc-HTTP-Server/Zinc-HTTP-Server.pillar@cha:zinc-server*`
14 - [REST Web Services](Zinc-REST/) | [html](https://ci.inria.fr/pharo-contribution/view/Books/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/Zinc-REST/Zinc-REST.html) [pdf](https://ci.inria.fr/pharo-contribution/view/Books/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/Zinc-REST/Zinc-REST.pdf) | `Chapter *@cha:zinc-rest*` link: `*Zinc Rest>../Zinc-REST/Zinc-REST.pillar@cha:zinc-rest*`
15 - [Building and deploying your first web app with Pharo](WebApp/) | [html](https://ci.inria.fr/pharo-contribution/view/Books/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/WebApp/WebApp.html) [pdf](https://ci.inria.fr/pharo-contribution/view/Books/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/WebApp/WebApp.pdf) | `Chapter *@cha:webApp*` link: `*WebApp>../WebApp/WebApp.pier@cha:webApp*`
16 - [WebSockets](WebSockets/) | [html](https://ci.inria.fr/pharo-contribution/view/Books/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/WebSockets/WebSockets.html) [pdf](https://ci.inria.fr/pharo-contribution/view/Books/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/WebSockets/WebSockets.pdf) | `Chapter *@cha:webSockets*` link: `*WebSockets>../WebSockets/WebSockets.pier@cha:webSockets*`

Tools
-----
There are mods/bundles/packages for text editors, that provide improvements for pillar files editing:

* Emacs: [pillar-mode](https://github.com/pillar-markup/pillar-mode)
* Vim: [vim-pillar](https://github.com/cdlm/vim-pillar)
* TextMate: [Pillar.tmbundle](https://github.com/pillar-markup/Pillar.tmbundle)
* ATOM: [language-pillar](https://github.com/pillar-markup/language-pillar)
