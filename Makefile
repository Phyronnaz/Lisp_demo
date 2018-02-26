BUILDDIR := $(shell pwd)/make_build/
GCC_FLAGS := -std=c++14 
export

.PHONY: lisp lisp_run lisp_test all clean

default: all

clean:
	$(MAKE) -C lisp clean
	-rm lisp_run

all: lisp lisp_run lisp_test

make_build/.dirstamp:
	mkdir make_build
	touch $@

lisp: make_build/.dirstamp
	$(MAKE) -C lisp all

lisp_run: main.cpp lisp
	g++ -I lisp/ -g -Wall $(GCC_FLAGS) main.cpp $(BUILDDIR)/lisp.a -o $@

lisp_test: lisp_tests/tests.cpp lisp
	g++ -I lisp/ -g -Wall $(GCC_FLAGS) lisp_tests/tests.cpp $(BUILDDIR)/lisp.a -o $@

