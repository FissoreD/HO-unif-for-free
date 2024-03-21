OUTPUTDIR = .aux
LATEX = pdflatex --shell-escape -output-directory=$(OUTPUTDIR) -synctex=1 -file-line-error -recorder
BIBER = biber --output-directory=$(OUTPUTDIR)

main: clean
	mkdir -p $(OUTPUTDIR) && \
	make -C code/ && \
	echo "---------------- 0 --------------------" && \
	${LATEX} main.tex -interaction=nonstopmode && \
	echo "---------------- 1 --------------------" && \
	# read a && \
	${BIBER} main && \
	echo "---------------- 2 --------------------" && \
	# read a && \
	${LATEX} main.tex -f && \
	echo "---------------- 3 --------------------" && \
	# read a && \
	${LATEX} main.tex

clean:
	rm -rf $(OUTPUTDIR)

.PHONY: main