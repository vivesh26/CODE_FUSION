%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex();
void yyerror(const char *s);

typedef struct {
    char name[50];
    int value;
} Symbol;

Symbol table[100];
int count = 0;

int getValue(char* name) {
    for(int i=0;i<count;i++)
        if(strcmp(table[i].name, name)==0)
            return table[i].value;

    printf("Error: Undefined variable %s\n", name);
    exit(1);
}

void setValue(char* name, int value) {
    for(int i=0;i<count;i++) {
        if(strcmp(table[i].name, name)==0) {
            table[i].value = value;
            return;
        }
    }
    strcpy(table[count].name, name);
    table[count].value = value;
    count++;
}
%}

%union {
    int num;
    char* str;
}

%token <num> NUMBER
%token <str> ID
%token PRINT

%type <num> expr term factor

%%

program:
    program statement
    | program '\n'
    | statement
;

statement:
    ID '=' expr end {
        setValue($1, $3);
    }
    |
    PRINT '(' expr ')' end {
        printf("%d\n", $3);
    }
    |
    PRINT expr end {
        printf("%d\n", $2);
    }
;

end:
    ';'
    | '\n'
;


expr:
    expr '+' term { $$ = $1 + $3; }
    | expr '-' term { $$ = $1 - $3; }
    | term { $$ = $1; }
;

term:
    term '*' factor { $$ = $1 * $3; }
    | term '/' factor {
        if($3 == 0) {
            printf("Error: Division by zero\n");
            exit(1);
        }
        $$ = $1 / $3;
    }
    | factor { $$ = $1; }
;

factor:
    NUMBER { $$ = $1; }
    | ID { $$ = getValue($1); }
    | '(' expr ')' { $$ = $2; }
;

%%

void yyerror(const char *s) {
    printf("Syntax Error: %s\n", s);
}
