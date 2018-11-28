

LEX = lex
YACC = yacc -d

CC = cc

simple_cal: y.tab.o lex.yy.o
	$(CC) -o simple_cal y.tab.o lex.yy.o -ll -lm

lex.yy.o: lex.yy.c y.tab.h

y.tab.c y.tab.h: simple_cal.y
	$(YACC) -v simple_cal.y

lex.yy.c: simple_cal.l
	$(LEX) simple_cal.l

clean:
	-rm -f *.o lex.yy.c *.tab.* simple_cal *.output
