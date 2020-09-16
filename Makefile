PREFIX ?= /usr/local
CC ?= cc

#output: dwmblocks.c blocks.def.h blocks.h
#	${CC} 'pkg-config --cflags X11 --libs X11' dwmblocks.c -o dwmblocks
#blocks.h:
#	cp blocks.def.h $@


output: dwmblocks.o
	gcc dwmblocks.o -lX11 -o dwmblocks

dwmblocks.o: dwmblocks.c blocks.h
	gcc -c -lX11 dwmblocks.c

blocks.h:
	cp blocks.def.h $@

clean:
	rm -f *.o *.gch dwmblocks blocks.h
install: output
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	install -m 0755 dwmblocks $(DESTDIR)$(PREFIX)/bin/dwmblocks
uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/dwmblocks
