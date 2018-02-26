.PHONY: all clean

default: all
all: lisp.yy.cpp lisp.tab.cpp lisp.tab.h

clean:
	-rm lisp.yy.cpp
	-rm lisp.tab.h
	-rm lisp.tab.cpp

lisp.yy.cpp: lisp.lex lisp.tab.h
	flex -o lisp.yy.cpp lisp.lex

lisp.tab.cpp lisp.tab.h: lisp.yacc
	bison -d lisp.yacc --defines=lisp.tab.h -o lisp.tab.cpp

