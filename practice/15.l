%{
  /*Lex program to count the positive numbers, negative numbers and fractions*/
  int pos=0, neg=0, pfra=0, nfra=0;
%}

digit [0-9]

%%

{digit}+ {pos++;}
-{digit}+ {neg++;}
{digit}+\.{digit}+ {pfra++;}
-{digit}+\.{digit}+ {nfra++;}

%%

int main(){
  yylex();
  printf("Positive numbers: %d\n", pos);
  printf("Negative numbers: %d\n", neg);
  printf("Positive fractions: %d\n", pfra);
  printf("Negative fractions: %d\n", nfra);
  return 0;
}

int yywrap(){
  return 1;
}