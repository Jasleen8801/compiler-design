%{
  /*3. write a program to recognize a valid arithmetic expression that uses operator +, - , * and / using YACC.*/
  #include <stdio.h>
  int yylex();
  int flag = 0;
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
	term '+' term { $$ = $1 + $3; flag=1; }
	| term '-' term { $$ = $1 - $3; flag=1; }
	| term '*' term { $$ = $1 * $3; flag=1; }
	| term '/' term { $$ = $1 / $3; flag=1; }
	| NUMBER { $$ = $1; }
%%

int main() {
	printf("Enter the expression\n");
	yyparse();
  if(flag==0)
    printf("Invalid expression\n");
  else if(flag==1)
    printf("Valid expression\n");
}

int yyerror(char* s) {
	printf("\nExpression is invalid\n");
}

/*
To run the program:
❯ flex 3.l
❯ bison -dy 3.y
❯ gcc lex.yy.c y.tab.c -o 3
❯ ./3

Error:
/usr/bin/ld: /tmp/ccCKEToc.o:(.bss+0x0): multiple definition of `flag'; /tmp/ccTp8wRZ.o:(.bss+0x28): first defined here
/usr/bin/ld: /tmp/ccCKEToc.o:(.bss+0x4): multiple definition of `yychar'; /tmp/ccTp8wRZ.o:(.bss+0x2c): first defined here
/usr/bin/ld: /tmp/ccCKEToc.o:(.bss+0x8): multiple definition of `yylval'; /tmp/ccTp8wRZ.o:(.bss+0x30): first defined here
/usr/bin/ld: /tmp/ccCKEToc.o:(.bss+0xc): multiple definition of `yynerrs'; /tmp/ccTp8wRZ.o:(.bss+0x34): first defined here
/usr/bin/ld: /tmp/ccCKEToc.o: in function `yyparse':
y.tab.c:(.text+0x28): multiple definition of `yyparse'; /tmp/ccTp8wRZ.o:lex.yy.c:(.text+0x28): first defined here
/usr/bin/ld: /tmp/ccCKEToc.o: in function `yyerror':
y.tab.c:(.text+0xa68): multiple definition of `yyerror'; /tmp/ccTp8wRZ.o:lex.yy.c:(.text+0xa68): first defined here
/usr/bin/ld: /tmp/ccCKEToc.o: in function `main':
y.tab.c:(.text+0xa10): multiple definition of `main'; /tmp/ccTp8wRZ.o:lex.yy.c:(.text+0xa10): first defined here
collect2: error: ld returned 1 exit status

*/