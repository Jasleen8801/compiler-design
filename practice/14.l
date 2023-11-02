%{
  /*Lex program to count the frequency of all the words in a file*/
  #include <stdio.h>
  #include <string.h>
  struct wordCnt {
    char word[1000];
    int count;
  };
  struct wordCnt wordList[1000];
  int numWords = 0;
%}

%%

[ \t\n]+ ;

[a-zA-Z]+ {
  char word[1000];
  strncpy(word, yytext, yyleng); 
  word[yyleng] = '\0';

  int found = 0;
  for(int i=0; i<numWords; i++){
    if(strcmp(wordList[i].word, word) == 0){ 
      wordList[i].count++;
      found = 1;
      break;
    }
  }

  if(!found){
    strcpy(wordList[numWords].word, word);
    wordList[numWords].count = 1;
    numWords++;
  }
}

. ;

%%

int main(){
  yylex();
  for(int i=0; i<numWords; i++){
    printf("%s %d\n", wordList[i].word, wordList[i].count);
  }
  return 0;
}

int yywrap(){
  return 1;
}