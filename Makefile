SRCS := $(wildcard src/*.bas)
PS := $(SRCS:src/%.bas=web/images/%.p)
PHS := $(SRCS:src/%.bas=web/images/%.p.hex)

all: p phex

p: ${PS}

phex: ${PHS}

web/images/%.p : src/%.bas
	zxtext2p -d -o $@ $<

%.p.hex : %.p
	xxd -p $< | tr -d '\n' > $@
