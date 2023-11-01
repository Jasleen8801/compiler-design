%{
  /*Study YACC tool in detail and implement the evaluator for arithmetic expressions (Desktop calculator).*/  
  #include "y.tab.h"
  extern int yylval;
%}

%% 

[0-9]+ { 
  yylval = atoi(yytext); 
  return NUMBER; 
} 

[ \t]+ ; 

\n		 { return 0; } 
.		 { return yytext[0]; } 

%% 
