%{
  /*Use YACC to find the number of bits in the given binary number.*/  
  #include <stdio.h>
  void yyerror(const char*s);
  int total = 0;
  int yylex();
%}

%token ZERO
%token ONE
%token EOL

%%

S: L '.' L {printf("The number of bits in the given binary number is %d\n",total);}
 | L {printf("The number of bits in the given binary number is %d\n",total);}
 ;
L : L B {total = total + $2;}
 | B {total = total + $1;}
 ;
B : ZERO {$$ = 1;}
  | ONE {$$ = 1;}
  ;

%%

int main() {
  printf("Enter the binary number: ");
  yyparse();
  return 0;
}

void yyerror(const char* s) {
  printf("%s\n",s);
}
