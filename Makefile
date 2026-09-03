.PHONY = main
main:
	lit lits/* --tangle --out-dir game/scripts/

server:
	ls lits/* | entr -s "make"
