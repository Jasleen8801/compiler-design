%{ 
    /* Write a LEX program to remove the comments from a c file. */
%}

s \/\/*
e \*\/

%%
\/\/(.*) {};					
\/\*(.*\n)*.*\*\/  {};			

%%

int main() {
    yyin = fopen("input.c", "r");
    yyout = fopen("output.c", "w");
    
    yylex();
    
    fclose(yyin);
    fclose(yyout);
    
    return 0;
}

// To run the program:
// ❯ flex 4.l
// ❯ gcc lex.yy.c -o output/4 -ll
// ❯ ./output/4
