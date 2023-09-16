%{
	/*
		4. Write lex program to identify the numbers whose individual digits are in ascending order.
	*/
%}

digit [0-9]

%%

{digit}+ {
	int num = atoi(yytext);
	int flag = 1;
	int prev = num % 10;
	num /= 10;
	while(num > 0) {
		if(num % 10 > prev) {
			flag = 0;
			break;
		}
		prev = num % 10;
		num /= 10;
	}
	if(flag) {
		printf("%s\n", yytext);
	}
}

%%

int main() {
	yyin = fopen("input3.txt", "r");
	yylex();
	fclose(yyin);
	return 0;
}

// To run:
// ❯ flex 10.l
// ❯ gcc lex.yy.c -o output/10 -ll
// ❯ ./output/10
