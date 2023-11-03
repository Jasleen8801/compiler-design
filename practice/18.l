%{
  /*Lex program to accept string starting with vowel*/
  #include<stdio.h>
%}

%%

[aeiouAEIOU].[a-zA-Z0-9.]+ printf("Valid String\n");
[a-zA-Z0-9]+ printf("Invalid String\n");

%%

int main(){
  yylex();
  return 0;
}

int yywrap(){
  return 1;
}
