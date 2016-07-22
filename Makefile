OUTPUTDIRECTORY = ./book-result

PDFCHAPTERS =           book-result/Teapot/Teapot.pdf \
			book-result/WebApp/WebApp.pdf \
			book-result/Zinc-Encoding-Meta/Zinc-Encoding-Meta.pdf \
			book-result/Zinc-HTTP-Client/Zinc-HTTP-Client.pdf \
			book-result/Zinc-HTTP-Server/Zinc-HTTP-Server.pdf \
			book-result/WebSockets/WebSockets.pdf \
			book-result/NeoCSV/NeoCSV.pdf \
			book-result/NeoJSON/NeoJSON.pdf \
			book-result/STON/STON.pdf \
			book-result/Fuel/Fuel.pdf \
			book-result/Voyage/Voyage.pdf \
			book-result/Mustache/Mustache.pdf \
			book-result/RenoirST/RenoirST.pdf \
			book-result/PillarChap/Pillar.pdf \
			book-result/Artefact/Artefact.pdf \
			book-result/DeploymentWeb/DeployForProduction.pdf

CHAPTERLATEXTEMPLATE = ./support/templates/chapter.latex.template
HTMLTEMPLATE = ./support/templates/chapter.html.template
BOOKLATEXTEMPLATE = ./support/templates/book.latex.template
PILLARTEMPLATE = ./support/templates/chapter.pillar.template

include copySupport.mk

initDir:
	mkdir -p $(OUTPUTDIRECTORY)

book: sbabook ./book-result/EnterprisePharo.pdf

chapters: $(PDFCHAPTERS)

.SECONDARY:

sbabook:
	git submodule update --init

#Tex compilation
$(OUTPUTDIRECTORY)/%.pillar.json: %.pillar copySupport
	./pillar export --to="Pillar by chapter" --path="${<}" $<

$(OUTPUTDIRECTORY)/%.pillar: $(OUTPUTDIRECTORY)/%.pillar.json
	./mustache --data=$< --template=${PILLARTEMPLATE} > $@

$(OUTPUTDIRECTORY)/EnterprisePharo.tex.json: EnterprisePharo.pillar copySupport
	./pillar export --to="latex:sbabook" --path="${<}" $<

$(OUTPUTDIRECTORY)/%.tex.json: %.pillar copySupport
	./pillar export --to="latex:sbabook" --path="${<}" $<

$(OUTPUTDIRECTORY)/EnterprisePharo.tex: $(OUTPUTDIRECTORY)/EnterprisePharo.tex.json
	./mustache --data=$< --template=${BOOKLATEXTEMPLATE} > $@

$(OUTPUTDIRECTORY)/%.tex: $(OUTPUTDIRECTORY)/%.tex.json
	./mustache --data=$< --template=${CHAPTERLATEXTEMPLATE} > $@

$(OUTPUTDIRECTORY)/%.pdf: $(OUTPUTDIRECTORY)/%.tex
	latexmk -f -cd -use-make -pdf $<
	make cleanBookResult

#HTML compilation
$(OUTPUTDIRECTORY)/%.html.json: %.pillar copySupport
	./pillar export --to="html" --path="${<}" $<

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
