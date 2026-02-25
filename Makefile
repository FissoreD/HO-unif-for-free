undefine TEX

SRC=src
OUT=img
GENERATOR = generate_tex.py

ELPIFILES := $(shell find . -type f -regex ".*\.\(elpi\|v\|hs\)")
PDFFILES := $(ELPIFILES:.elpi=.ign)

test:
	cd $(SRC) && timeout 4 elpi main.elpi $(ENV) -exec "main" -- $(ONLY) $(TEX)

debug:
	cd $(SRC) && elpi main.elpi -D DEBUG -exec "main" -- $(ONLY) $(TEX)
trace:
	cd $(SRC) && elpi main.elpi -trace-on -trace-at run 1 10000 -no-tc -trace-only user -exec "main" -- $(ONLY)

generator: $(PDFFILES)

%.ign: %.elpi
	mkdir -p $(OUT) && python3 $(GENERATOR) $(OUT) $<	

.PHONY: paper
