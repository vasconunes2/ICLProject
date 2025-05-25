
all: minipython.exe
	dos2unix ./test.py
	./minipython.exe --debug test.py
	gcc -no-pie -g test.s && ./a.out

minipython.exe:
	dune build minipython.exe

clean:
	dune clean

.PHONY: all clean minipython.exe



