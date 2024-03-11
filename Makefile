paper:
	cd paper && make

test-shallow:
	cd shallow && timeout 4 elpi main.elpi $(ENV) -exec "main" -- $(ONLY)
test-deep:
	cd deep && timeout 4 elpi main.elpi $(ENV) -exec "main" -- $(ONLY)
test: test-deep
test-all: test-deep test-shallow 
debug:
	cd deep && elpi main.elpi -D DEBUG -exec "main" -- $(ONLY)
trace:
	cd deep && elpi main.elpi -trace-on -trace-at run 1 10000 -no-tc -trace-only user -exec "main" -- $(ONLY)
.PHONY: paper