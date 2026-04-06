%{
#include "parser.tab.h"
#include <stdlib.h>
#include <string.h>
%}

%%

"print"        { return PRINT; }
"printf"       { return PRINT; }

[0-9]+         { yylval.num = atoi(yytext); return NUMBER; }

[a-zA-Z_][a-zA-Z0-9_]* {
    yylval.str = strdup(yytext);
    return ID;
}

"="            { return '='; }
"+"            { return '+'; }
"-"            { return '-'; }
"*"            { return '*'; }
"/"            { return '/'; }

"("            { return '('; }
")"            { return ')'; }

";"            { return ';'; }

\r\n           { return '\n'; }
\n             { return '\n'; }

[ \t\r]        ;   

.              ;

%%

int yywrap() { return 1; }