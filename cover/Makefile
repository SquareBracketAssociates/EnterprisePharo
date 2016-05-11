.phony : all

all : cover-text.png isbn-barcode.png

%.pdf : %.tex
	latexmk $*

%.png : %.pdf
	convert -density 800 $< $@
