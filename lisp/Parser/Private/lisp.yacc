%{
#include <cstdio>
#include <iostream>

#include "object.h"

using namespace std;

extern int yylex();
extern int yyparse();
extern FILE *yyin;
extern int yylineno;
extern char *yytext;

void yyerror(char const *msg);

static Object reverse(Object l) {
  Object m = nil();
  for (Object p = l; !null(p); p = cdr(p)) {
    m = cons(car(p), m);
  }
  return m;
}

static Object result;

Object get_read_Object() {
  return result;
}

%}

/* Declarations */

%token <number_value> Token_number
%token <string_value> Token_symbol
%token <string_value> Token_string
%token Token_lpar Token_rpar
%token Token_nil
%token Token_quote
%token Token_blank
%token Token_EOF

%type <Object_value> list_expr
%type <Object_value> expr
%type <Object_value> main

%union {
  Object   Object_value;
  int    number_value;
  char    *string_value;
}

%start main             /* the entry point */

%%
/* Grammar rules */

main:
list_rpar expr          {$$ = $2; result = $$; YYACCEPT;}
| Token_EOF              {YYABORT; }
;

expr:
Token_number            {$$ = (number_to_Object($1));}
| Token_nil             {$$ = (nil());}
| Token_symbol          {$$ = (symbol_to_Object($1));}
| Token_string          {$$ = (string_to_Object($1));}
| Token_lpar list_expr Token_rpar
                         {$$ = (reverse($2));}
                         // Right order is back! :-)
;

list_expr:
%empty                   {$$ = nil();}
| list_expr expr         {$$ = (cons($2,$1)); }
                          // Watch it: reverse order... :-(
;

list_rpar:
%empty    {}
| list_rpar Token_rpar  {}
;

%%
/* Additional functions */

void yyerror(const char *s) {
  cerr << "ERROR: " << s << " at symbol \"" << yytext << "\""
  << "on line " << yylineno << endl;
  exit(1);
}
