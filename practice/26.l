%{
  //Lex program to check whether given string is Palindrome or Not
  int i, j, flag;
%}

%%

[a-zA-Z0-9]* {
  flag = 1;
  for(i=0, j=yyleng-1; i<yyleng/2; i++, j--){
    if(yytext[i] != yytext[j]){
      flag = 0;
      break;
    }
  }
  if(flag == 1){
    printf("String is Palindrome\n");
  }
  else{
    printf("String is not Palindrome\n");
  }
}

%%

int main(){
  yylex();
  return 0;
}

int yywrap(){
  return 1;
}
