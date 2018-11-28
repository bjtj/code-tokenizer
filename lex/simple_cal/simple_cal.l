%{
#include <stdio.h>
#include "y.tab.h"

int yywrap(void) {
    return 1;
}
%}

%%

"+" { return ADD; }
"-" { return SUB; }
"*" { return MUL; }
"/" { return DIV; }
"(" { return OPEN; }
")" { return CLOSE; }
"\n" { return CR; }

([0-9]+)|([0-9]*"."[0-9]+) {
double temp;
sscanf(yytext, "%lf", &temp);
yylval.double_val = temp;
return NUMBER;
}
[\t ]+ ;
. return EOF;

%%
