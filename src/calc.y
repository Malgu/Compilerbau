
%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <math.h>
	#include "./lib/functions.h"
	int yyerror(char *);
	extern int yylex(void);
	extern int zahl;
%}

%token PLUS MINUS
%token OPENING_B CLOSING_B
%token MULT
%token INTEGER
%token COMMA
%token LCM
%token GCD
%token GD
%token FIB
%token LOG

%start final

%%
final:
	expr {printf("\n\nFinal Solution: %i\n\n", $1);}
	;
expr:
	term expr1
	{
		int solution = $1 + $2;
		printf("\nZwischenstand = %i\n", solution);
		$$ = solution;
	}
	;

expr1:
	PLUS term expr1
	{
		$$ = $2 + $3;
	}
	| { $$ = 0; }
	;

term:
	factor term1
	{
		$$ = $1 * $2;
	}
	;

term1:
	MULT factor term1
	{
		$$ = $2 * $3;
	}
	| { $$ = 1; }
	;

factor:
	unaryExpr
	| binaryExpr
	| OPENING_B expr CLOSING_B { $$ = $2; }
	| INTEGER { $$ = zahl; }
	;

unaryExpr:
	unaryOp OPENING_B expr CLOSING_B
	{
		if($1 == 1)
			$$ = next_fib($3);
		else if($1 == 2)
			$$ = g_div($3);
		else if($1 == 3)
			$$ = log($3);
	}
	;

binaryExpr:
	binaryOp OPENING_B expr COMMA expr CLOSING_B
	{
		if($1 == 1)
		{
			$$ = l_com_mult($3,$5);
		}
		else if($1 == 2)
			$$ = g_com_div($3,$5);
	}
	;

unaryOp:
	FIB {$$ = 1;}
	| GD {$$ = 2;}
	| LOG {$$ = 3;}
	;

binaryOp:
	LCM {$$ = 1;}
	| GCD {$$ = 2;}
	;

%%
#include "lex.yy.c"

int yyerror(char *s)
{
    fprintf(stderr, "%s\n", s);
    return 0;
}

int main(void)
{
    yyparse();
    return 0;
}


