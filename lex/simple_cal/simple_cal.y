%{
#include <stdio.h>
#include <stdlib.h>
%}

%union {
    double double_val;
    }

%token	<double_val>	 NUMBER
%left ADD SUB
%left MUL DIV
%left OPEN CLOSE
%token CR
%type	<double_val>	 expression primary_expression

%%
line_list:	line
	|	line_list line
	;
line:		expression CR { printf(" = %lf\n", $1); }
	|	CR
	;

expression:	primary_expression
	|	expression ADD expression { $$ = $1 + $3; }
	|	expression SUB expression { $$ = $1 - $3; }
	|	expression MUL expression { $$ = $1 * $3; }
	|	expression DIV expression { $$ = $1 / $3; }
	;

primary_expression:
		NUMBER
	|	OPEN expression CLOSE { $$ = $2; }
	;

%%

int yyerror(char const * str) {
    extern char * yytext;
    fprintf(stderr, "parse error near %s\n", yytext);
    return 0;
}

int main(void) {
    extern int yyparse(void);
    extern FILE * yyin;

    yyin = stdin;
    if (yyparse()) {
	fprintf(stderr, "Error!\n");
	exit(1);
    }
}
