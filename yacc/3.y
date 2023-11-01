%{
  // Use YACC to Convert Binary to Decimal.
  #include <stdio.h>
  void yyerror(char *s);
  int yylex(void);
%}

%union{
  struct {
    int nb;
    double dval;
  } node;
}

%token ZERO ONE DOT
%token EOL
%type <node> B L S

%%

S: L DOT L {
    $$.nb = $1.nb + $3.nb;
    $$.dval = $1.dval + $3.dval / (1 << $3.nb);
    printf("Decimal Value: %.2f\n", $$.dval);
  }
  | L EOL {
    $$.nb = $1.nb;
    $$.dval = $1.dval;  
    printf("Decimal Value: %.2f\n", $$.dval);
  }
  ;

L: L B {
    $$.nb = $1.nb + $2.nb;
    $$.dval = 2*$1.dval + $2.dval;
  }
  | B {
    $$.nb = $1.nb;
    $$.dval = $1.dval;
  }
  ;
B: ZERO {
    $$.nb = 1;
    $$.dval = 0;
  }
  | ONE {
    $$.nb = 1;
    $$.dval = 1;
  }
  ;

%%

int main(void){
  printf("Enter Binary Number: ");
  yyparse();
  return 0;
}

void yyerror(char *s){
  printf("%s\n", s);
}