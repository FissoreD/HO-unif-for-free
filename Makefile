SRC=src

undefine TEX

test:
	cd $(SRC) && timeout 4 elpi main.elpi $(ENV) -exec "main" -- $(ONLY) $(TEX)

debug:
	cd $(SRC) && elpi main.elpi -D DEBUG -exec "main" -- $(ONLY) $(TEX)
trace:
	cd $(SRC) && elpi main.elpi -trace-on -trace-at run 1 10000 -no-tc -trace-only user -exec "main" -- $(ONLY)
.PHONY: paper
