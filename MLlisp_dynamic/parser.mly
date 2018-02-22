/* File parser.mly */
%{
open Types
%}

/* Declarations */

%token <int> Token_num
%token <string> Token_symbol
%token <string> Token_string
%token Token_lpar Token_rpar
%token Token_nil
%token Token_quote

%start main             /* the entry point */
%type  <Types.lisp_object> main

%%
/* Grammar rules */

main:
  | list_rpar expr          {$2}
;

expr:
  | Token_num               {Lisp_num ($1)}
  | Token_nil               {Lisp_list([])}
  | Token_symbol            {Lisp_symbol($1)}
  | Token_string            {Lisp_string($1)}
  | Token_quote expr        {Lisp_list
                                ((Lisp_symbol("quote"))::($2)::[])}
  | Token_lpar list_expr Token_rpar
                            {Lisp_list ($2)}
;

list_expr:
  | /* Nothing */            {[]}
  | list_expr expr           {($1)@[$2]}
;

list_rpar:
  | /* Nothing */             {}
  | list_rpar Token_rpar      {}
;

%%

(* Empty Ocaml trailer section *)
