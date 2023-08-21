%{
    /* Program to identify floating point numbers  */
    /* 
    digit->single digit
    num->multiple digits (positive integer)
    snum->signed number
    */
%}

digit[0-9]
/* regular expression denoted below */
num {digit}+ 
snum [-+]?{num}

%%

({snum}(\.{num}))|([+-]?{num}\.{num}) { // no need of specifying sign coz it is snum already
    printf("==>%s is a floating-point \n", yytext); // ytext returns address of token where pattern was matched
}

({snum}) {
    printf("==>%s is not a floating-point number \n", yytext);
}

%%

int yywrap() {
    return 1; // indicate the end of input
}

int main() {
    printf("Enter any number: \n");
    yylex(); //transfer the data to rule section.. pattern matching and so on
    return 0;
}  

/* to run the program
    flex name.l
    gcc lex.yy.c -o output/name -lfl
    cd output
    ./name
*/