%{
  // Use YACC to Convert Binary to Decimal.
  #include "y.tab.h"
%}

%%

0 {return ZERO;}
1 {return ONE;}
\. {return DOT;}
[ \t]+ { }
"\n" {return EOL;}

%%

int yywrap(void) {
  return 1;
}