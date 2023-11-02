%{
  /*Lex Program to remove comments from C program*/
  #include<stdio.h>
%}

%%

"/*"([^*]|\*[^/])*"*/" {printf("Comment removed");}
"//"(.*) {printf("Comment removed");}
. {printf("%c",yytext[0]);}

%%

int main(){
  yylex();
  return 0;
}


int yywrap(){
  return 1;
}