%{
  /*Lex Program to count the number of lines, spaces and tabs*/
  #include<stdio.h>
  int lines=0,spaces=0,tabs=0,words=0;
  int cnt;
%}

%%

[\n] {lines++; cnt+=yyleng;}
[ ] {spaces++; cnt+=yyleng;}
[^\t] {tabs++; cnt+=yyleng;}
[a-zA-Z]+ {words++; cnt+=yyleng;}
. {cnt+=yyleng;}

%%

int main(){
  yyin=fopen("input8.txt","r");
  yylex();
  printf("Lines = %d\n",lines);
  printf("Spaces = %d\n",spaces);
  printf("Tabs = %d\n",tabs);
  printf("Words = %d\n",words);
  return 0;
}

int yywrap(){
  return 1;
}