gen = python3 generate_tex.py $(1);

all:
	$(foreach F, $(wildcard ../../code/deep/*.elpi), $(call gen,$(F))) true
