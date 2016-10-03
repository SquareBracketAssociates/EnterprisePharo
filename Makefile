OUTPUTDIRECTORY = ./book-result

CHAPTERS = \
	book-result/Teapot/Teapot \
	book-result/WebApp/WebApp \
	book-result/Zinc-Encoding-Meta/Zinc-Encoding-Meta \
	book-result/Zinc-HTTP-Client/Zinc-HTTP-Client \
	book-result/Zinc-HTTP-Server/Zinc-HTTP-Server \
	book-result/WebSockets/WebSockets \
	book-result/NeoCSV/NeoCSV \
	book-result/NeoJSON/NeoJSON \
	book-result/STON/STON \
	book-result/Fuel/Fuel \
	book-result/Voyage/Voyage \
	book-result/Mustache/Mustache \
	book-result/RenoirST/RenoirST \
	book-result/PillarChap/Pillar \
	book-result/Artefact/Artefact \
	book-result/DeploymentWeb/DeployForProduction

CHAPTERLATEXTEMPLATE = ./support/templates/chapter.latex.template
HTMLTEMPLATE = ./support/templates/chapter.html.template
BOOKLATEXTEMPLATE = ./support/templates/book.latex.template
PILLARTEMPLATE = ./support/templates/chapter.pillar.template

include copySupport.mk

initDir:
	mkdir -p $(OUTPUTDIRECTORY)

book: sbabook ./book-result/EnterprisePharo.pdf

chapters: chapters-pdf chapters-html

chapters-pdf: sbabook $(CHAPTERS:=.pdf)

chapters-html: sbabook $(CHAPTERS:=.html)

.SECONDARY:

sbabook:
	git submodule update --init

#Tex compilation
$(OUTPUTDIRECTORY)/%.pillar.json: %.pillar copySupport
	./pillar export --to="Pillar by chapter" --outputFile=$< $<

$(OUTPUTDIRECTORY)/%.pillar: $(OUTPUTDIRECTORY)/%.pillar.json
	./mustache --data=$< --template=${PILLARTEMPLATE} > $@

$(OUTPUTDIRECTORY)/EnterprisePharo.tex.json: EnterprisePharo.pillar copySupport
	./pillar export --to="latex:sbabook" --outputFile=EnterprisePharo $<

$(OUTPUTDIRECTORY)/%.tex.json: %.pillar copySupport
	./pillar export --to="LaTeX by chapter" --outputFile=$< $<

$(OUTPUTDIRECTORY)/EnterprisePharo.tex: $(OUTPUTDIRECTORY)/EnterprisePharo.tex.json
	./mustache --data=$< --template=${BOOKLATEXTEMPLATE} > $@

$(OUTPUTDIRECTORY)/%.tex: $(OUTPUTDIRECTORY)/%.tex.json
	./mustache --data=$< --template=${CHAPTERLATEXTEMPLATE} > $@

$(OUTPUTDIRECTORY)/%.pdf: $(OUTPUTDIRECTORY)/%.tex
	latexmk -f -cd -use-make -pdf $<
	make cleanBookResult

#HTML compilation
$(OUTPUTDIRECTORY)/%.html.json: %.pillar copySupport
	./pillar export --to="HTML by chapter" --outputFile=$< $<

$(OUTPUTDIRECTORY)/%.html: $(OUTPUTDIRECTORY)/%.html.json
	./mustache --data=$< --template=${HTMLTEMPLATE} > $@

#cleaning
cleanWorkspace: clean
	rm -r ${OUTPUTDIRECTORY} || true
	rm -f *.pdf

clean:
	rm -f *.aux *.log *.fls *.fdb_latexmk *.lof EnterprisePharo.out *.toc *.listing

cleanBookResult:
	rm ${OUTPUTDIRECTORY}/*.aux ${OUTPUTDIRECTORY}/*.fls ${OUTPUTDIRECTORY}/*.log ${OUTPUTDIRECTORY}/*.fdb_latexmk || true
