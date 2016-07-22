OUTPUTDIRECTORY = ./book-result

CHAPTER = Teapot/Teapot.pillar \
			WebApp/WebApp.pillar \
			Zinc-Encoding-Meta/Zinc-Encoding-Meta.pillar \
			Zinc-HTTP-Client/Zinc-HTTP-Client.pillar \
			Zinc-HTTP-Server/Zinc-HTTP-Server.pillar \
			WebSockets/WebSockets.pillar \
			NeoCSV/NeoCSV.pillar \
			NeoJSON/NeoJSON.pillar \
			STON/STON.pillar \
			Fuel/Fuel.pillar \
			Voyage/Voyage.pillar \
			Mustache/Mustache.pillar \
			RenoirST/RenoirST.pillar \
			PillarChap/Pillar.pillar \
			Artefact/Artefact.pillar \
			DeploymentWeb/DeployForProduction.pillar

UPDATEDCHAPTER = ./book-result/Teapot/Teapot.pillar \
			./book-result/WebApp/WebApp.pillar \
			./book-result/Zinc-Encoding-Meta/Zinc-Encoding-Meta.pillar \
			./book-result/Zinc-HTTP-Client/Zinc-HTTP-Client.pillar \
			./book-result/Zinc-HTTP-Server/Zinc-HTTP-Server.pillar \
			./book-result/WebSockets/WebSockets.pillar \
			./book-result/NeoCSV/NeoCSV.pillar \
			./book-result/NeoJSON/NeoJSON.pillar \
			./book-result/STON/STON.pillar \
			./book-result/Fuel/Fuel.pillar \
			./book-result/Voyage/Voyage.pillar \
			./book-result/Mustache/Mustache.pillar \
			./book-result/RenoirST/RenoirST.pillar \
			./book-result/PillarChap/Pillar.pillar \
			./book-result/Artefact/Artefact.pillar \
			./book-result/DeploymentWeb/DeployForProduction.pillar

CHAPTERLATEXTEMPLATE = ./support/templates/chapter.latex.template
HTMLTEMPLATE = ./support/templates/chapter.html.template
BOOKLATEXTEMPLATE = ./support/templates/book.latex.template
PILLARTEMPLATE = ./support/templates/chapter.pillar.template

include copySupport.mk

initDir:
	mkdir -p $(OUTPUTDIRECTORY)

book: sbabook ./book-result/EnterprisePharo.pdf

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
	latexmk -f -outdir=${OUTPUTDIRECTORY} -use-make -pdf $<
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
	rm ${OUTPUTDIRECTORY}/*.aux ${OUTPUTDIRECTORY}/*.fls ${OUTPUTDIRECTORY}/*.log ${OUTPUTDIRECTORY}/*.fdb_latexmk
