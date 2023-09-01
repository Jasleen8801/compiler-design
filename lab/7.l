%{
	/*2. Write a LEX program to perform following operations.
Assume the file is containing a sequence of words (groups of letters) separated by white space. Every
time you encounter a word:
a. If the first letter is a consonant, move it to the end of the word and then add ay.
b. If the first letter is a vowel, just add ay to the end of the word. All non-letters are copied intact to
the output.*/
%}

c[a-zA-Z]
vowel[aeiouAEIOU]
cons[^aeiouAEIOU]

%%

{cons}{c}* {
	/*move first letter to end of word and then add "ay"*/
	char s[100];
	strcpy(s,yytext+1); 
	strncat(s,yytext,1); // strncat(s,yytext,1) is same as strcat(s,yytext[0])
	strcat(s,"ay");
	printf("%s",s);
	fprintf(yyout,"%s",s);
}

{vowel}{c}* {
	/*copy yytext to an array and append "ay" to it*/
	char s[100];
	strcpy(s,yytext);
	strcat(s,"ay");
	printf("%s",s);
	fprintf(yyout,"%s",s);
}

([^c]+) {
    /* Non-letter characters are copied as-is */
    printf("%s", yytext);
    fprintf(yyout, "%s", yytext);
}

%%

int main() {
	yyin = fopen("input.txt", "r");
	yyout = fopen("output.txt", "w");
	yylex();
	fclose(yyin);
	fclose(yyout);
	return 0;
}

//❯ flex 7.l
// ❯ gcc lex.yy.c -o output/7 -ll
// ❯ ./output/7
