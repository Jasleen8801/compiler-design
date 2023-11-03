%{
  /*Lex program to count words that are less than 10 and greater than 5*/
  #include <stdio.h>
  #include <string.h>
  int len=0, count=0;
%}

%%

[a-zA-Z]+ {len=strlen(yytext);
           if(len>5 && len<10)
           count++;
          }

%%

int main(){
  yylex();
  printf("Number of words with length greater than 5 and less than 10 are %d\n", count);
  return 0;
}

int yywrap(){
  return 1;
}
