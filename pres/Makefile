OUTPUTDIR = .aux
LATEX = pdflatex --shell-escape -output-directory=$(OUTPUTDIR) -synctex=1 -file-line-error -recorder
BIBER = biber --output-directory=$(OUTPUTDIR)

main: clean
	mkdir -p $(OUTPUTDIR) && \
	echo "---------------- 0 --------------------" && \
	${LATEX} pres.tex -interaction=nonstopmode && \
	echo "---------------- 1 --------------------" && \
	# read a && \
	${BIBER} pres && \
	echo "---------------- 2 --------------------" && \
	# read a && \
	${LATEX} pres.tex -f && \
	echo "---------------- 3 --------------------" && \
	# read a && \
	${LATEX} pres.tex

clean:
	rm -rf $(OUTPUTDIR)

.PHONY: main