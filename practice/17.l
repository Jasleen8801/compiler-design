%{
  // Lex program to check whether the input is digit or not
  #include<stdio.h>
%}

digit [0-9]

%%

^{digit}* printf("Valid digit");
^[^digit][digit]*[a-zA-Z] printf("Invalid digit");
. ;

%%

int main(){
  yylex();
  return 0;
}

int yywrap(){
  return 1;
}
