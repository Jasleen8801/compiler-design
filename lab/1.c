#include <stdio.h>      

int main() {
    char str[100];
    int wCnt=0, lCnt=0, cCnt=0;
    printf("Enter the string: ");
    scanf("%[^~]", str);

    for(int i=0; str[i]!='\0'; i++){
        if(str[i]==' ') wCnt++;
        else if(str[i] == '\n') {lCnt++; wCnt++;}
        else if(str[i] != ' ' && str[i] != '\n') cCnt++;
    }
    if(cCnt > 0) {
        wCnt++;
        lCnt++;
    }

    printf("Total number of words: %d\n", wCnt);
    printf("Total number of lines: %d\n", lCnt);
    printf("Total number of characters: %d\n", cCnt);

    return 0;
}

// To end the input, write the "~" at end.