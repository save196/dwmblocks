PREFIX  := /usr/local
CC      := cc
CFLAGS  := -pedantic -Wall -Wno-deprecated-declarations -Os
LDFLAGS :=

# x11 builds dwmblocks, wayland builds dwlblocks
MODE = x11
BIN  = dwmblocks
LIBS = -lX11
ifeq ($(MODE),wayland)
BIN  = dwlblocks
LIBS =
override CPPFLAGS += -DNO_X
endif

# FreeBSD (uncomment)
#LDFLAGS += -L/usr/local/lib -I/usr/local/include
# # OpenBSD (uncomment)
#LDFLAGS += -L/usr/X11R6/lib -I/usr/X11R6/include

all: options ${BIN}

options:
	@echo dwmblocks build options:
	@echo "MODE    = ${MODE}"
	@echo "CFLAGS  = ${CFLAGS}"
	@echo "LDFLAGS = ${LDFLAGS}"
	@echo "CC      = ${CC}"

${BIN}: dwmblocks.c blocks.def.h blocks.h
	${CC} -o $@ dwmblocks.c ${CPPFLAGS} ${CFLAGS} ${LDFLAGS} ${LIBS}

blocks.h:
	cp blocks.def.h $@

clean:
	rm -f *.o *.gch dwmblocks dwlblocks

install: ${BIN}
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -f ${BIN} ${DESTDIR}${PREFIX}/bin
	chmod 755 ${DESTDIR}${PREFIX}/bin/${BIN}

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/${BIN}

.PHONY: all options clean install uninstall
