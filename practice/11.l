%{
  /*Lex program to copy content of one file to another*/
  #include <stdio.h>
  #include <string.h>
  char line[1000];
%}

%%

"\n" { 
  if(strlen(line)>0){
    fprintf(yyout, "%s\n", line);
    line[0] = '\0';
  } else {
    fprintf(yyout, "\n");
  }
}

(.*) { strcpy(line, yytext); }

<<EOF>> { 
  if(strlen(line)>0){
    fprintf(yyout, "%s", line);
  }
  return 0;
}

%%

int main(){
  yyin = fopen("input11.txt", "r");
  yyout = fopen("output11.txt", "w");
  yylex();
  fclose(yyin);
  fclose(yyout);
  return 0;
}

int yywrap(){
  return 1;
}