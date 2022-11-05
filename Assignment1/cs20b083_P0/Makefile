clean:
	rm -f lex.yy.c *.tab.c a.out *.exe *~

%.exe: %.l %.y
	flex $<
	bison $(word 2,$^)
	gcc -g $*.tab.c -o $@ -lfl
