%{
  /*Lex program to check whether a given number is even or odd*/
  #include <stdio.h>
  int i=0;
%}

%%

[0-9]+ { 
  i=atoi(yytext);
  if(i%2==0) printf("Even\n");
  else printf("Odd\n");
}

%%

int main(){
  yylex();
  return 0;
}

int yywrap(){
  return 1;
}
