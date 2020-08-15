%option noyywrap
%{
#include <stdio.h>
#include <stdlib.h>
int zahl = 0;
%}
DIGIT [0-9]
NONZERO [1-9]
%%
{DIGIT}|{NONZERO}{DIGIT}+ { printf("Integer: %s\n", yytext); zahl = atoi(yytext); return INTEGER;}
"gd" { printf("Function for Greatest Divisor: %s\n", yytext); return GD;}
"log" { printf("Function for Naturial Logarithm: %s\n", yytext); return LOG;}
"gcd" { printf("Function for Greatest Common Divisor: %s\n", yytext); return GCD;}
"lcm" { printf("Function for Least Common Multiple: %s\n", yytext); return LCM;}
"fib" { printf("Function for next Fibonacci Number: %s\n", yytext); return FIB;}
"," { printf("Comma: %s\n", yytext); return COMMA;}
"+" { printf("Plus operator: %s\n", yytext); return PLUS;}
"*" { printf("Multiplication operator: %s\n", yytext); return MULT;}
"(" { printf("Opening bracket: %s\n", yytext); return OPENING_B;}
")" { printf("Closing bracket: %s\n", yytext); return CLOSING_B;}
[ \t\n]+ {/* Do nothing at whitespace - eat it! */}
"E" {printf("\nExiting the calculator.\n"); return 0; }
. {printf("Unrecognized token: %s, Exiting!\n", yytext); /* Is there anything else? Fail on it! */ return 1; }
