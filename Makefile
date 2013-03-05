a.out:hoc1.l hoc1.y
	 yacc -d hoc1.y ; flex -l hoc1.l ; gcc -DYYDEBUG y.tab.c lex.yy.c
clean:
	-rm -f y.tab.h y.tab.c lex.yy.c a.out
