%{
  /*Lex program to count number of words*/
  #include <stdio.h>
  #include <string.h>
  int cnt = 0;
%}

%%

([a-zA-Z0-9])* { cnt++; }
"\n" { printf("%d\n", cnt); cnt = 0; }

%%

int main(){
  yylex();
  return 0;
}

int yywrap(){
  return 1;
}