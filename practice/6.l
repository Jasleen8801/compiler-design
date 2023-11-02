%{
  /*Lex program to accept a valid integer and float value*/
  #include<stdio.h>
  int valInt = 0, valFloat = 0;
%}

%%
^[-+]?[0-9]* {valInt++;}
^[-+]?[0-9]*\.[0-9]+ {valFloat++;}
. ;
%%

int main(){
  yylex();
  if(valInt!=0) printf("Valid Integer\n");
  else if(valFloat!=0) printf("Valid Float\n");
  else printf("Invalid\n"); 
  return 0;
}

int yywrap(){
  return 1;
}
