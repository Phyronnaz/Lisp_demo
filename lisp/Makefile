.PHONY: lisp all clean

FILES := $(shell find . -name \*.cpp -print)

DIRS := $(shell pwd)

default: all
all: lisp

clean:
	$(MAKE) -C Parser/Private clean
	-rm -rf $(O_FILES)
	-rm $(DEPEND_FILE)

lisp: Makefile
	$(MAKE) -C Parser/Private all
	@$(foreach file,$(FILES),echo "g++ -I $(DIRS) -g -Wall $(GCC_FLAGS) $(file) -c -o $(BUILDDIR)/$(shell basename $(file) .cpp).o";)
	@$(foreach file,$(FILES),g++ -I $(DIRS) -g -Wall $(GCC_FLAGS) $(file) -c -o $(BUILDDIR)/$(shell basename $(file) .cpp).o;)
	ar rsv $(BUILDDIR)/lisp.a $(BUILDDIR)/*.o

$(DEPEND_FILE): $(CPP_FILES) $(H_FILES)
	@echo "Computing dependencies..."
	g++ -MM -I $(shell pwd) $(GCC_FLAGS) $(CPP_FILES) $(HH_FILES) > $@