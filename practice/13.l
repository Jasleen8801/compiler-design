%{
  /*Lex program to count the frequency of the given word in a file*/
  #include <stdio.h>
  #include <string.h>
  char word[] = "geeks";
  int count = 0;
%}

%%

[a-zA-Z]+ {
  if(strcmp(yytext, word) == 0)
    count++;
}

. ;

%%

int main(){
  yylex();
  printf("Count: %d", count);
  return 0;
}

int yywrap(){
  return 1;
}