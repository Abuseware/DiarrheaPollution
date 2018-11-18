AS=ca65
LD=ld65

ASFLAGS=-Iinclude -tnes -g
LDFLAGS=-tnes

srcdir = src
objdir = obj

src = $(wildcard $(srcdir)/*.s)
obj = $(patsubst $(srcdir)/%,$(objdir)/%,$(src:.s=.o))


.PHONY: all clean

.SUFFIXES: .nes

$(objdir)/%.o: $(srcdir)/%.s
	$(AS) $(ASFLAGS) -o $@ $<

%.nes:
	$(LD) $(LDFLAGS) -Ln $(@:.nes=.sym) -m $(@:.nes=.map) --dbgfile $(@:.nes=.dbg) -o $@ $^

all: test.nes

clean:
	rm -f test.nes
	rm -f $(obj)

test.nes: $(obj)
