copySupport: initDir
	find . -type d -path $(OUTPUTDIRECTORY) -prune -o -wholename "*/figures" -exec rsync -rR {} $(OUTPUTDIRECTORY) \;
	cp -R support $(OUTPUTDIRECTORY)
	cp .latexmkrc $(OUTPUTDIRECTORY)
