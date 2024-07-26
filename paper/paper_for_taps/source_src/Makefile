LATEX = pdflatex --shell-escape
BIBER = biber
FILENAME = PPDP2024-1

main:
	echo "---------------- 0 --------------------" && \
	${LATEX} ${FILENAME}.tex && \
	echo "---------------- 1 --------------------" && \
	${BIBER} ${FILENAME} && \
	echo "---------------- 2 --------------------" && \
	${LATEX} ${FILENAME}.tex && \
	echo "---------------- 3 --------------------" && \
	${LATEX} ${FILENAME}.tex

.PHONY: main