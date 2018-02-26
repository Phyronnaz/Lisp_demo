.SUFFIX:
.SUFFIX: .ml .lsp .mll .mly .native
.PHONY: default all clean atom indent run graph doc commit zip

LISP = lisp

default: $(LISP).native $(LISP).cma

all: default

FILES = \
	types.ml \
	globals.ml \
	lexer.mll \
	parser.mly \
	output.ml \
	utils.ml \
	objects.ml \
	defs.ml \
	env.ml \
	eval.ml \
	subr.ml \
	toplevel.ml \
	lisp.ml

$(LISP).native: $(FILES)
	ocamlbuild $@

$(LISP).cma: $(FILES)
	ocamlbuild $@

clean:
	-ocamlbuild -clean
	-latexmk -c
	-rm -rf $(HTMLDIR)
	-rm *~ \#* *.pdf *.ps graph.* *.html *.out *.dot
	-rm *.sty *.tex *.dvi *.pdf *.log

indent:
	ocp-indent --inplace *.ml

atom: indent
	atom $(FILES)

print: indent
	enscript $(FILES) -o a.ps
	ps2pdf a.ps listing.pdf
	rm a.ps

run: $(LISP).native
	rlwrap ./$<

run-cma: $(LISP).cma
	rlwrap ocaml -I _build $<

graph: $(LISP)
	ocamldoc -warn-error -I _build -dot *.ml -o graph.dot
	dot -T pdf graph.dot > graph.pdf
	open graph.pdf

HTMLDIR = ./_html

OCAMLDOCFLAGS = -warn-error -colorize-code -charset utf-8 -keep-code -I _build

doc: $(LISP)
	-mkdir $(HTMLDIR)
	ocamldoc $(OCAMLDOCFLAGS) -latex -d $(HTMLDIR) *.ml
	# open $(HTMLDIR)/index.html

commit: clean indent
	git commit -a -m 'Committing'
	git status

DIRNAME = MLlisp_dynamic

zip: all clean
	cd ..; zip -r $(DIRNAME).zip $(DIRNAME)

