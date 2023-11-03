%{
  /*1. Write a program in LEX to recognize words in the text having two or more than two vowels. Take an input file having a paragraph and print the intended words in the output file.*/
  #include <stdio.h>
  #include <string.h>
  int cnt=0;
%}

vowel [aeiouAEIOU]
letter [a-zA-Z]

%%

{letter}*{vowel}{letter}*{vowel}{letter}* {
  fprintf(yyout, "%s\n", yytext);
  cnt++;
}

. {}

[ \t]+ {}

%%

int main(){
  yyin = fopen("input1.txt", "r");
  yyout = fopen("output1.txt", "w");
  yylex();
  printf("There are %d words having two or more vowels", cnt);
  fclose(yyin);
  fclose(yyout);
  return 0;
}

int yywrap(void) {
  return 1;
}

/*
To run the program:
❯ flex 1.l
❯ gcc lex.yy.c -o 1
❯ ./1
*/