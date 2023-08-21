%{ 
    /* Write a program in LEX to recognize different tokens: Keywords, Identifiers, Constants,
Operators and Punctuation symbols */
%}

digit [0-9]
letter [a-zA-Z]
identifier ({letter}({letter}|{digit})*)
constant ({digit}+)
operator ([+\-*/=])
punctuation (";"|"{"|"}"|","|"("|")")

%%

"if"|"else"|"while"|"for"|"int"|"float"|"void"|"main"|"printf" {
    printf("Keyword: %s\n", yytext);
}
{identifier} {
    printf("Identifier: %s\n", yytext);
}
{constant} {
    printf("Constant: %s\n", yytext);
}
{operator} {
    printf("Operator: %s\n", yytext);
}
{punctuation} {
    printf("Punctuation: %s\n", yytext);
}

%%

int yywrap() {
    return 1;
}

int main() {
    // printf("Enter code: \n");
    yylex();
    return 0;
}   

/* To enter multiline input: 
    ./output/lex_program <<EOF
    int main() {
        float x = 5.0;
        for (int i = 0; i < 10; i++) {
            printf("Hello, world!");
        }
        return 0;
    }
    EOF
*/
