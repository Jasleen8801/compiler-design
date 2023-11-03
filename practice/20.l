%{
  /*Lex program to add line numbers to a given file*/
  #include <stdio.h>
  int line=1;
%}

line .*\n 

%%

{line} { printf("%10d %s", line++, yytext); }

%%

int main(){
  yyin = fopen("input20.txt", "r");
  yylex();
  fclose(yyin);
  return 0;
}

int yywrap(){
  return 1;
}
