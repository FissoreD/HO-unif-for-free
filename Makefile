DEEP_DIR="code/deep"
SHAL_DIR="code/shallow"

undefine TEX

paper:
	cd paper && make

test-deep:
	cd $(DEEP_DIR) && timeout 4 elpi main.elpi $(ENV) -exec "main" -- $(ONLY) $(TEX)
test-shallow:
	cd $(SHAL_DIR) && timeout 4 elpi main.elpi $(ENV) -exec "main" -- $(ONLY) $(TEX)
test: test-deep
test-all: test-deep 
debug:
	cd $(DEEP_DIR) && elpi main.elpi -D DEBUG -exec "main" -- $(ONLY) $(TEX)
trace:
	cd $(DEEP_DIR) && elpi main.elpi -trace-on -trace-at run 1 10000 -no-tc -trace-only user -exec "main" -- $(ONLY)
.PHONY: paper
