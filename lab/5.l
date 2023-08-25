%{ 
    /* Write a LEX program to recognize the following tokens over the alphabets {0,1,..,9}
    a) The set of all string ending in 00.
    b) The set of all strings with three consecutive 222’s.
    c) The set of all string such that every block of five consecutive symbols contains at least two 5’s.
    */
%}

%%
[0-9]*00 {
    printf("Token A: %s\n", yytext);
}

[0-9]*222[0-9]* {
    printf("Token B: %s\n", yytext);
}

([0-9]*5[0-9]*5[0-9]*)+ {
    printf("Token C: %s\n", yytext);
}

%%

int main() {
    yylex();
    return 0;
}

// TO run this program:
// ❯ flex 5.l
// ❯ gcc lex.yy.c -o output/5 -lfl
// ❯ ./output/5 < input_strings.txt

