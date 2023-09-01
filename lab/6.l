%{
	/*1. Write lex program for
			a. The set of all strings such that the 10th symbol from the right end is 1.
			b. The set of all four digits numbers whose sum is 9*/ 
%}

d[0-9]

%%

({d}*1{d}{9}) {
	printf("Token 1: %s\n", yytext);
}

({d}{d}{d}{d})	{
	int num = atoi(yytext); // atoi: ASCII to Integer
	//  atoi(yytext) is being used to convert the contents of the yytext variable into an integer value.
	int sum=0;
	int temp=num;
	while(temp>0){
		sum += temp%10;
		temp/=10;
	}
	if(sum==9)
		printf("Token 2: %s\n", yytext);
	else
		printf("Invalid string: %s\n", yytext);
}

%%

int main() {
	yylex();
	return 0;
}

// To run the program:
// 1. ❯ flex 6.l
// 2. ❯ gcc lex.yy.c -o output/6 -ll
// 3. ❯ ./output/6 < input_strings_1.txt

