%{
  /*Use YACC to find the number of bits in the given binary number.*/  
  #include "y.tab.h"
%}

%option noyywrap
  
%%

0 {return ZERO;}
1 {return ONE;}

[\t ]+ { }
"\n" {return EOL;}

%%