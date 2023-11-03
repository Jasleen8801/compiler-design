%{
  /*Lex program to check whether given number is armstrong number or not*/
  #include <math.h>
  #include <string.h>

  void check(char *);
%}

%%

[0-9]+  {check(yytext);}

%%

int main(){
  yylex();
  return 0;
}

void check(char *a){
  int len = strlen(a), num;
  for(int i=0; i<len; i++)
    num = num*10 + (a[i]-'0');
  int x=0, y=0, temp=num;
  while(num>0){
    y = pow((num%10), len);
    x += y;
    num /= 10;
  }
  if(x == temp)
    printf("%d is an armstrong number\n", temp);
  else
    printf("%d is not an armstrong number\n", temp);
}

int yywrap(){
  return 1;
}
