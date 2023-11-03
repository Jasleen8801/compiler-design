%{
  /*Lex program to check valid email*/
  #include <stdio.h>
%}

%%

[a-zA-Z0-9+]+@[a-z]+.[a-zA-Z]+ {printf("Valid email\n");}

%%

int main(){
  yylex();
  return 0;
}

int yywrap(){
  return 1;
}
