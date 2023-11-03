%{
  //Lex program for Decimal to Binary Conversion
  #include<stdio.h>
  int num, r, b=0, p=1;
%}

digit [0-9]

%%

{digit}+ {num=atoi(yytext);
          while(num>0){
            r=num%2;
            b=b+r*p;
            p=p*10;
            num=num/2;
          }
          printf("Binary equivalent is %d\n", b);
          }
.* {printf("Invalid input\n");}

%%

int main(){
  yylex();
  return 0;
}

int yywrap(){
  return 1;
}
