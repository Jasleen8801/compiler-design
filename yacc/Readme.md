# YACC - Yet Another Compiler Compiler

## Introduction
- Used for parsing 
- LALR(1) parser generator
- Annotated syntax directed tree
- input: stream of tokens
- output: parse tree(theoretically) and syntax tree (practically)
- grammar: semantic action 
- does parsing and semantic analysis

## Parts

- a.y file -> y.tab.c + y.tab.h (hidden header file)  
- a.l file -> lex.yy.c (define y.tab.h in declaration section)
- lex.yy.c + y.tab.c -> a.out (executable file - parser)
- a.out + input file -> output file (syntax tree)

## Code

- a.y file
```
%{
  // Declaration section
  LEFT or RIGHT associativity
  define header files  
%}

// Token section
%token <token_name> token_value
%type <type_name> non_terminal_name

%%

// translation rules
// grammatical rule: semantic action
non_terminal_name : token_value {semantic_action}
                  | non_terminal_name {semantic_action}
                  | non_terminal_name {semantic_action}
                  ;

%%

int main(){
  yyparse();
  return 0;
}

```
E->E+T | T   
<!-- ($$ $1+$3) ($$=$1) -->
T->T*F | F
F->id
```
expr: expr '+' term {printf("%d", $1+$3);}
    | term {printf("%d", $1);}
    ;
term: term '*' factor {printf("%d", $1*$3);}
    | factor {printf("%d", $1);}
    ;
factor: id {printf("%d", $1);}
    ;
```
// neeche waale ka precedence jyada hota hai
// start writing semantic action from last one
// non terminal on left side value is represented by '$$'
// value/terminal on right side value is represented by '$1', '$2', '$3' and so on (1,2,3 is the order of appearance of the value in the rule)

## Compilation

```
bison -dy a.y
flex a.l
gcc lex.yy.c y.tab.c -ll
./a.out < input_file
```

## Binary numbers

```
S->L.L {$$=$1+$3;}
  | L {$$=$1;}
L->LB {$$=$1+$2;}
  | B {$$=$1;}
B->0  {$$=1;}
  | 1 {$$=2;}
```

