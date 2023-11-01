%{
  /* Study YACC tool in detail and implement the evaluator for arithmetic expressions (Desktop calculator). */
  #include <stdio.h>
  int yylex();
  int yyerror(char* s);
%}

%token NUMBER
%left '+' '-'
%left '*' '/'

%%
expr : term	 {
  printf("Result = %d\n", $$);
  return 0;
}

term : 
	term '+' term { $$ = $1 + $3; }
	| term '-' term { $$ = $1 - $3; }
	| term '*' term { $$ = $1 * $3; }
	| term '/' term { $$ = $1 / $3; }
	| '-' NUMBER { $$ = -$2; }
	| '(' term ')' { $$ = $2; }
	| NUMBER { $$ = $1; }
%%

int main() {
	printf("Enter the expression\n");
	yyparse();
}

int yyerror(char* s) {
	printf("\nExpression is invalid\n");
}

int yywrap() {
  return 1;
}


// To run:
// $ flex 1.l
// $ bison -dy 1.y
// $ gcc lex.yy.c y.tab.c -o output/1
// $ ./1