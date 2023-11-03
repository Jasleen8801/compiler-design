%{
  /*Lex program to check if characters other than alphabets occur in a string*/
%}

%%

[a-zA-Z]+ {printf("Valid String\n");}
.* {printf("Invalid String\n");}

%%

int main(){
  yylex();
  return 0;
}

int yywrap(){
  return 1;
}
