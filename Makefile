AS=ca65
LD=ld65

ASFLAGS=-Iinclude -I. -tnes -g
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
	$(LD) $(LDFLAGS) --dbgfile $(@:.nes=.dbg) -o $@ $^

all: test.nes

clean:
	rm -f test.nes test.dbg
	rm -f $(obj)

test.nes: $(obj)
