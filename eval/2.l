%{
  /*2. Write a program in LEX to recognize the strings starting with 34 and ending with 12 over alphabets {0,1…..9}.*/
  #include <stdio.h>
  int flag = 0;
%}

digit [0-9]

%%

^34[0-9]*12 {flag = 1; printf("String accepted\n");}

%%

int yywrap(void) {
  return 1;
}

int main(){
  yylex();
  if(flag == 0)
    printf(" String not accepted\n");
  return 0;
}

/*To run the program:
❯ flex 2.l
❯ gcc lex.yy.c -o 2
❯ ./2 < input2.txt
*/