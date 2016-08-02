copySupport: initDir
	find . -type d -path $(OUTPUTDIRECTORY) -prune -o -wholename "*/figures" -exec rsync -rR {} $(OUTPUTDIRECTORY) \;
	cp -r support/ $(OUTPUTDIRECTORY)
	cp .latexmkrc $(OUTPUTDIRECTORY)
