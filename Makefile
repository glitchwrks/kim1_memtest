AFLAGS		= -t none
LFLAGS		= -t none
 
CC		= cc65
CA		= ca65
CL		= cl65

all: clean ttytest.hex

memtest.o: memtest.a65
	$(CA) $(AFLAGS) -o memtest.o memtest.a65

memtest.bin: memtest.o
	$(CL) $(LFLAGS) -C kim-1.cfg -o memtest.bin memtest.o

ttytest.hex: ttytest.bin
	dd if=ttytest.bin of=ttytest_tmp.bin bs=256 skip=2
	srec_cat ttytest_tmp.bin -binary -offset 0x0200 -o ttytest.hex -mos_tech
	rm ttytest_tmp.bin
	perl -i -pe 's|\n|\r\n|' ttytest.hex

ttytest.bin:
	$(CL) $(LFLAGS) -C kim-1.cfg -l ttytest.prn -o ttytest.bin ttytest.a65

clean:
	rm -f *.o *.bin *.bin.bak *.hex *.prn
