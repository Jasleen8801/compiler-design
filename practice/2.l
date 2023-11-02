%{
  /*Lex Program to implement a simple calculator*/
  #include <stdio.h>
  #include <math.h>
  int op=0, i;
  float a, b, res;

  void helper(void);
%}

digit [0-9]+|([0-9]*)"."([0-9]+)
add "+"
sub "-"
mul "*"
div "/"
pow "^"
ln \n

%%

{digit} {helper();}
{add} {op=1;}
{sub} {op=2;}
{mul} {op=3;}
{div} {op=4;}
{pow} {op=5;}
{ln} {printf("%f\n", res);}

%%

void helper(){
  if(op==0)
    res = atof(yytext); //converts string to float
  else {
    b = atof(yytext);
    switch(op){
      case 1: res += b; break;
      case 2: res -= b; break;
      case 3: res *= b; break;
      case 4: res /= b; break;
      case 5: res = pow(res, b); break;
    }
    op = 0;
  }
}

int main(){
  yylex();
  return 0;
}

int yywrap(){
  return 1;
}
