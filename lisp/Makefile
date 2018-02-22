.SUFFIXES:
.SUFFIXES: .l .y .cc .hh .o .c .h .orig .depend
.PHONY: clean all syntax astyle enscript geany emacs atom

default: all
all: lisp

CC_FILES := $(wildcard *.cc)
HH_FILES := $(wildcard *.hh)
O_FILES := $(CC_FILES:%.cc=%.o)

GCC_FLAGS :=

DEPEND_FILE := lisp.depend
include $(DEPEND_FILE)

$(O_FILES): %.o: %.cc Makefile
	g++ -g -Wall $(GCC_FLAGS) $< -c -o $@

## Syntactic analyser #########################

C_SYNTAX_FILES	:= lisp.yy.c lisp.tab.c
O_SYNTAX_FILES	:= $(C_SYNTAX_FILES:%.c=%.o)

syntax: $(O_SYNTAX_FILES)

lisp.yy.c: lisp.lex lisp.tab.h Makefile
	flex -o $@ $<

## lisp.tab.h is generated as a side-effect of lisp.tab.c
## First, we construct the name of the C file
## Then we call a common construction rule with the right argument
lisp.tab.c: SOURCE_C_FILE=$@
lisp.tab.h: SOURCE_C_FILE=$(@:%.h=%.c)
lisp.tab.c lisp.tab.h: lisp.yacc Makefile
	bison -d -o $(SOURCE_C_FILE) $<

read.o: lisp.tab.h

SYNTAX_FLAGS := -Wno-unused-function -Wno-unused-variable -Wno-sign-compare

$(O_SYNTAX_FILES): %.o: %.c
	g++ -g -Wall $(GCC_FLAGS) $(SYNTAX_FLAGS) $< -c -o $@

###########################

lisp: $(O_FILES) $(O_SYNTAX_FILES) Makefile
	g++ -g -Wall $(GCC_FLAGS) $(O_FILES) $(O_SYNTAX_FILES) -o $@

ASTYLE_OPTIONS := --style=attach --indent=spaces=2

astyle:
	astyle $(ASTYLE_OPTIONS) $(CC_FILES) $(HH_FILES)

clean:
	-rm $(O_FILES) $(O_SYNTAX_FILES) $(C_SYNTAX_FILES) lisp.tab.h
	-rm $(DEPEND_FILE)
	-rm -r *.dSYM html latex
	-rm *.orig
	-rm lisp listing.pdf

ENSCRIPT_BASE_FILES := cell object read main

ENSCRIPT_FILES := \
	$(shell \
	for F in $(ENSCRIPT_BASE_FILES); \
		do \
		if test -r $$F.hh; then LIST+=" $$F.hh"; fi; \
		if test -r $$F.cc; then LIST+=" $$F.cc"; fi; \
	done; \
	LIST+=" Makefile lisp.lex lisp.yacc"; \
	echo $$LIST)

ENSCRIPT_OPTIONS := --language=PostScript --missing-characters \
	--borders --nup=2 --word-wrap --mark-wrapped=arrow

enscript: astyle
	enscript $(ENSCRIPT_OPTIONS) $(ENSCRIPT_FILES) -o listing.ps
	pstopdf listing.ps listing.pdf; rm listing.ps

EDIT_FILES := $(sort $(CC_FILES) $(HH_FILES)) lisp.lex lisp.yacc Makefile

emacs geany: astyle clean
	open -a $@ $(EDIT_FILES) &

atom: astyle clean
	open -a $@ . &

include $(DEPEND_FILE)

$(DEPEND_FILE): $(CC_FILES) $(HH_FILES)
	@echo "Computing dependencies..."
	@# Trick to let a fake file with this name exist for the g++ -MM command
	@-touch lisp.tab.h
	g++ -MM $(GCC_FLAGS) $(CC_FILES) $(HH_FILES) > $@
	@# Delete this fake file
	@-rm lisp.tab.h
