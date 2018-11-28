all:
	yacc -d calc.yacc
	lex calc.lex
	cc y.tab.c lex.yy.c

clean:
	rm -rf *.tab.* lex.yy.c *.output *.o
