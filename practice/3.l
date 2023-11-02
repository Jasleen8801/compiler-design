%{
  /*Lex Program to count the number of vowels and consonants in a given string*/
  #include<stdio.h>
  int vow=0,con=0;
%}

%%

[aeiouAEIOU] {vow++;}
[a-zA-Z] {con++;}

. ;

%%

int main(){
  yylex();
  printf("Vowels: %d\nConsonants: %d\n",vow,con);
  return 0;
}

int yywrap(){
  return 1;
}
