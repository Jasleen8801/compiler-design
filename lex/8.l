%{
	/*
		1. Write a Lex program to find and print all numbers in an input file that contain a specific digit, such as the digit 7
		2. Create a Lex program to identify and count binary numbers (numbers composed of only 0s and 1s) in an input file.
	*/
	#include <stdio.h>
	int binary_count = 0;
%}

digit [0-9]
binary [01]

%%

{digit}*7{digit}*	{
	printf("Number %s contains 7\n", yytext);
}

{binary}+	{
	// printf("Binary number %s\n", yytext);
	binary_count++;
}

%%

int main(){
	yyin = fopen("input1.txt", "r");
	if (!yyin) {
		perror("Error opening input1.txt");
		return 1;
	}

	yylex();
	
	printf("Total binary numbers found: %d\n", binary_count);
	fclose(yyin);
	return 0;
}

// To run:
// ❯ flex 8.l
// ❯ gcc lex.yy.c -o output/8 -ll
// ❯ ./output/8
