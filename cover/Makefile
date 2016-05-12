.phony : all

all : cover-text-0.png cover-text-1.png isbn-barcode.png

cover-text-0.png cover-text-1.png : cover-text.pdf
	convert -density 800 $< cover-text-%d.png

%.pdf : %.tex
	latexmk $*

%.png : %.pdf
	convert -density 800 $< $@
