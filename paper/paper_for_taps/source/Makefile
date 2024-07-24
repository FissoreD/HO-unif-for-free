LATEX = pdflatex --shell-escape -synctex=1 -file-line-error -recorder
BIBER = biber

main:
	echo "---------------- 0 --------------------" && \
	${LATEX} main.tex -interaction=nonstopmode && \
	echo "---------------- 1 --------------------" && \
	${BIBER} main && \
	echo "---------------- 2 --------------------" && \
	${LATEX} main.tex -f && \
	echo "---------------- 3 --------------------" && \
	${LATEX} main.tex

.PHONY: main