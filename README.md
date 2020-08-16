# compilerbau
This project consists of a compilation program for a calculator.
## Compiling and running the calculator
commands for running:
"make all"
runs lex and yacc to create the calculator

"make clear"
removes the files produced from lex and yacc

"calc"
runs the calculator
## Example calculations
fib(13)\*gd(43)E

4+lcm(43,32)*(gd(54)+1)E

The letter "E" at the end of each calculation tells the calculator that the calculations is at its end.

All possible functions are explained in in the file "lib/function.h"

## Modifications

1. Output the greatest integer which divides the number without rest: gd(21) -> 7

2. Define the natural Logarithm with integer as outpur: log(11) -> 2

3. Output greatest common divisor: gcd(21,35) -> 7

4. Output least common multiple: lcm(5,7) -> 35

5. Output next Fibonacci number if input is x: fib(30) -> 34 or fib(51) -> 55

## Grammar
expr=term,expr1;

expr1 ="+",term,expr1|;

term=factor,term1;

term1="*",factor,term1|;

factor=unaryExpr|binaryExpr|"(",expr,")"|number;

unaryExpr=unaryOp,"(",expr,")";

binaryExpr=binaryOp,"(",expr,",",expr,")";

unaryOp="fibo"|"gdiv"|"log";

binaryOp="lcm"|"gcd";

number=zero|nonzero,{digit};

zero="0";

nonzero="1"|"2"|"3"|"4"|"5"|"6"|"7"|"8"|"9";

digit="0"|"1"|"2"|"3"|"4"|"5"|"6"|"7"|"8"|"9";

syntax=expr;
