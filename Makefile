BUILD_TEX = latexmk -pdf --shell-escape -synctex=1 -interaction=nonstopmode -file-line-error -recorder -output-directory=".aux"

MYDIR = .

list: $(MYDIR)/*.tex
	for file in $^ ; do \
		${BUILD_TEX} $${file} ; \
		${BUILD_TEX} $${file} ; \
		cd .aux/; cp ../bib.bib .; bibtex $${file%.tex}; \
		cd - ; \
		${BUILD_TEX} $${file} ; \
	done

test:
	cd elpi_code/enrico ; elpi -test main.elpi