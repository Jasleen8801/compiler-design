%{
  /*Lex program to check if a Date is valid or not*/ 
  #include<stdio.h>
  int i=0, yr=0, valid=0;
%}

%%

([0-2][0-9]|3[0-1])\/(0(1|3|5|7|8))|(10|12)\/([1-2][0-9][0-9][-0-9]) {valid=1;}

([0-2][0-9]|30)\/((0(4|6|9))|11)\/([1-2][0-9][0-9][0-9]) {valid=1;} 

([0-1][0-9]|2[0-8])\/02\/([1-2][0-9][0-9][0-9]) {valid=1;} 

29\/02\/([1-2][0-9][0-9][0-9]){
  while(yytext[i]!='/')i++; i++; 
  while(yytext[i]!='/')i++;i++; 
  while(i<yyleng)yr=(10*yr)+(yytext[i++]-'0');  
  if(yr%4==0||(yr%100==0&&yr%400!=0))valid=1;
}

%%

int main(){
  yylex();
  if(valid==1) printf("Valid Date\n");
  else printf("Invalid Date\n");
  return 0;
}

int yywrap(){
  return 1;
}
