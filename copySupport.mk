copySupport: initDir
	find . -type d -path $(OUTPUTDIRECTORY) -prune -o -wholename "*/figures" -exec cp {} --parents -r ${OUTPUTDIRECTORY} \;
	cp -r support/ $(OUTPUTDIRECTORY)
	cp .latexmkrc $(OUTPUTDIRECTORY)
