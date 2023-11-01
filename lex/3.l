%{ 
    /* Write a LEX program that copies a file, replacing each nonempty sequence of white spaces
by a single blank. */
%}

s[]

%%

[ ]([ ])* {/* Pattern for recognising multiple spaces */
    fprintf(yyout, " ");
}

%%

// int yywrap() {
//     return 1;
// }

int main() {
    // point yyin to a file with text this acts as input to our program
    yyin = fopen("text1.txt", "r");
    // Point yyout to output file.
    yyout = fopen("text2.txt", "w");
    yylex();
    return 0;
}

// 15 marks quiz before mst
// 15 marks lab after mst before diwali (single)

// To run this program:
// ❯ flex 3.l
// ❯ gcc lex.yy.c -o output/3 -ll
// ❯ cd output
// ❯ ./3

