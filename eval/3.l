%{
  /*3. write a program to recognize a valid arithmetic expression that uses operator +, - , * and / using YACC.*/
  #include "y.tab.c"
  // extern int yylval;
%}


%option noyywrap

%%

[0-9]+ { 
  yylval = atoi(yytext); 
  return NUMBER; 
} 

[ \t]+ ; 

\n		 { return 0; } 
.		 { return yytext[0]; } 

%%