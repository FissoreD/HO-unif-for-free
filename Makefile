paper:
	cd paper && make

test-shallow:
	cd shallow && elpi main.elpi -exec "main" -- $(ONLY)
test-deep:
	cd deep && elpi main.elpi -exec "main" -- $(ONLY)
test: test-deep
test-all: test-deep test-shallow 

.PHONY: paper