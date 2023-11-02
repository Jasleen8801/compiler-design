%{
  /*Lex Program to recognise valid arithmetic expression and identify the identifiers and operators.*/
  #include<stdio.h>
  #include<string.h>
  int opCnt=0, idCnt=0, valid=1, top=-1, i=0;
  char id[10][10], op[10][10], stack[100];
%}

%%

"(" { stack[++top]='('; }
"{" { stack[++top]='{'; }
"[" { stack[++top]='['; }
 
")" {
  if(stack[top]!='(')
    valid=0;
  else if(idCnt>0 && (idCnt-opCnt)!=1)
    valid=0;
  else{
    top--;
    idCnt=1;
    opCnt=0;
  }
}

"}" {
  if(stack[top]!='{')
    valid=0;
  else if(idCnt>0 && (idCnt-opCnt)!=1)
    valid=0;
  else{
    top--;
    idCnt=1;
    opCnt=0;
  }
}

"]" {
  if(stack[top]!='[')
    valid=0;
  else if(idCnt>0 && (idCnt-opCnt)!=1)
    valid=0;
  else{
    top--;
    idCnt=1;
    opCnt=0;
  }
}

"+"|"-"|"*"|"/"|"%" {
  opCnt++;
  strcpy(op[i++],yytext);
}

[0-9]+|[a-zA-Z][a-zA-Z0-9]* {
  idCnt++;
  strcpy(id[i++],yytext);
}

[ \n] ; //ignore spaces and new lines

%%

int main(){
  yylex();
  if(valid==1)
    printf("Valid Expression\n");
  else
    printf("Invalid Expression\n");
  return 0;
}

int yywrap(){
  return 1;
}

/*
To run the program:
❯ flex 1.l
❯ gcc lex.yy.c -o output/1
❯ ./output/1 < input1.txt
Valid Expression
*/