%{
  /*Lex Program to take input from file and remove multiple spaces, lines and tabs*/
  #include<stdio.h>
%}

%%

[ \t]+ { fprintf(yyout, " "); }
\n+    { fprintf(yyout, "\n"); }
.      { fprintf(yyout, "%s", yytext); }

%%

int main(){
  yyin = fopen("input9.txt", "r");
  yyout = fopen("output9.txt", "w");
  yylex();
  fclose(yyin);
  fclose(yyout);
  return 0;
}

int yywrap(){
  return 1; 
}
