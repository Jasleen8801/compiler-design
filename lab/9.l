%{
	/*
		Write a Lex program to identify and count the number of even and odd numbers in a given input file.
	*/
	#include <stdio.h>
	int even_cnt = 0, odd_cnt = 0;
%}

digit [0-9]

%%

{digit}+ {
	int num = atoi(yytext);
	if(num % 2 == 0) {
		printf("Even number: %d\n", num);
		even_cnt++;
	} else {
		printf("Odd number: %d\n", num);
		odd_cnt++;
	}
}

%%

int yywrap() {
	return 1;
}

int main() {
	yyin = fopen("input2.txt", "r");

	yylex();

	printf("Even count: %d\n", even_cnt);
	printf("Odd count: %d\n", odd_cnt);

	fclose(yyin);
	return 0;
}

// To run:
	// ❯ flex 9.l
	// ❯ gcc lex.yy.c -o output/9 -ll
	// ❯ ./output/9
