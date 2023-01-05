SRCS := $(wildcard src/*.bas)
PS := $(SRCS:src/%.bas=web/images/%.p)
PHS := $(SRCS:src/%.bas=web/images/%.p.hex)

all: p phex

p: ${PS}

phex: ${PHS}

web/images/%.p : src/%.bas
	~/sw/zxtext2p/zxtext2p -o $@ $<

%.p.hex : %.p
	xxd -p $< | tr -d '\n' > $@
