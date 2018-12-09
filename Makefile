AS=ca65
CC=cl65
LD=ld65

ASFLAGS=-Iinclude -I. -tnes -g
CFLAGS=-Iinclude -I. -tnes -g -Oirs -Cl -T -c
LDFLAGS=-tnes

srcdir = src
objdir = obj

src_s = $(wildcard $(srcdir)/*.s)
src_c = $(wildcard $(srcdir)/*.c)
obj_s = $(patsubst $(srcdir)/%,$(objdir)/%,$(src_s:.s=.o))
obj_c = $(patsubst $(srcdir)/%,$(objdir)/%,$(src_c:.c=.o))


.PHONY: all clean

.SUFFIXES: .nes

$(objdir)/%.o: $(srcdir)/%.s
	$(AS) $(ASFLAGS) -o $@ $<

$(objdir)/%.o: $(srcdir)/%.c
	$(CC) $(CFLAGS) -o $@ $<

%.nes:
	$(LD) $(LDFLAGS) --dbgfile $(@:.nes=.dbg) -o $@ $^ nes.lib

all: test.nes

clean:
	rm -f test.nes test.dbg
	rm -f $(obj_c)
	rm -f $(obj_s)

test.nes: $(obj_c) $(obj_s)
