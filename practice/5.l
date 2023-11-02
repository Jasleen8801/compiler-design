%{
  /*Lex code to count total number of tokens*/
  #include<stdio.h>
  int cnt = 0;
%}

keyword "int"|"float"|"char"|"double"|"long"|"short"|"signed"|"unsigned"|"void"|"auto"|"const"|"extern"|"register"|"static"|"volatile"|"enum"|"struct"|"union"|"typedef"|"sizeof"|"if"|"else"|"switch"|"case"|"default"|"break"|"continue"|"for"|"do"|"while"|"goto"|"return"|"printf"|"scanf"|"main"|"include"|"define"|"NULL"|"FILE"|"EOF"|"stdin"|"stdout"|"stderr"|"getc"|"putc"|"getchar"|"putchar"|"gets"|"puts"|"fopen"|"fclose"|"fgetc"|"fputc"|"fgets"|"fputs"|"fscanf"|"fprintf"|"fseek"|"ftell"|"rewind"|"fgetpos"|"fsetpos"|"clearerr"|"feof"|"ferror"|"perror"|"malloc"|"calloc"|"realloc"|"free"|"exit"|"abort"|"atexit"|"getenv"|"system"|"rand"|"srand"|"time"|"signal"|"raise"|"va_start"|"va_arg"|"va_end"|"va_copy"|"va_list"|"setjmp"|"longjmp"|"jmp_buf"|"endl"

delim [ \t\n]

id [a-zA-Z_][a-zA-Z0-9_]*

num [0-9]+

op [+-/*%]

%%

{keyword} {cnt++; printf("Keyword: %s\n", yytext);}

{delim} {cnt++; printf("Delimiter: %s\n", yytext);}

{id} {cnt++; printf("Identifier: %s\n", yytext);}

{num} {cnt++; printf("Number: %s\n", yytext);}

{op} {cnt++; printf("Operator: %s\n", yytext);}

. {cnt++; printf("Invalid Token: %s\n", yytext);}

%%

int main(){
  yylex();
  printf("Total number of tokens: %d\n", cnt);
  return 0;
}

int yywrap(){
  return 1;
}
