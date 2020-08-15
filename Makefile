clear:
	rm calc
	rm y.tab.c
	rm lex.yy.c
	rm y.tab.h

all:
	lex ./src/calc.l
	yacc ./src/calc.y
	gcc y.tab.c ./lib/functions.c -o calc -ly -lm -ll
