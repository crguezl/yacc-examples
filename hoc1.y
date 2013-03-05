%{
#define YYSTYPE double
#include <stdio.h>
%}
%token NUMBER
%left '+' '-'
%left '*' '/'
%%
list 
    :
    | list '\n'  
    | list expr   { printf("%.8g\n",$2);}
    ;

expr 
    : NUMBER { $$ = $1; } 
    | expr '+' expr {$$ = $1 + $3; }
    ;

%%

extern FILE * yyin;

main(int argc, char **argv) {
  if (argc > 1) yyin = fopen(argv[1],"r");
  //yydebug = 1;
  yyparse();
}

yyerror(char *s) {
  printf("%s\n",s);
}
