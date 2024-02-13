BUILD_TEX = latexmk -pdf --shell-escape -synctex=1 -interaction=nonstopmode -file-line-error -recorder -output-directory=".aux"

MYDIR = .

list: $(MYDIR)/*.tex
	for file in $^ ; do \
		${BUILD_TEX} $${file} ; \
		cd .aux/; cp ../bib.bib .; bibtex $${file}; \
		cd - ; \
		${BUILD_TEX} $${file} ; \
		${BUILD_TEX} $${file} ; \
	done

test-shallow:
	cd shallow && elpi main.elpi -exec "main" -- $(ONLY)
test-deep:
	cd deep && elpi main.elpi -exec "main" -- $(ONLY)
test: test-deep
test-all: test-deep test-shallow 