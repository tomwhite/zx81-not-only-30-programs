SRCS := $(wildcard src/*.bas)
PS := $(SRCS:src/%.bas=web/images/%.p)
PHS := $(SRCS:src/%.bas=web/images/%.p.hex)

$(info SRCS is $(SRCS))
$(info PS is $(PS))
$(info PHS is $(PHS))

p: ${PS}

phex: ${PHS}

all: p phex

web/images/%.p : src/%.bas
	~/sw/zxtext2p/zxtext2p -o $@ $<

%.p.hex : %.p
	xxd -p $< | tr -d '\n' > $@
