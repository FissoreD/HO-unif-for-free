paper:
	cd paper && make

test-shallow:
	cd shallow && timeout 2 elpi main.elpi $(ENV) -exec "main" -- $(ONLY)
test-deep:
	cd deep && timeout 2 elpi main.elpi $(ENV) -exec "main" -- $(ONLY)
test: test-deep
test-all: test-deep test-shallow 
debug:
	cd deep && elpi main.elpi -D DEBUG -exec "main" -- $(ONLY)
.PHONY: paper