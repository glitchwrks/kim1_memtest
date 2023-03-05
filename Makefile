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
	srec_cat ttytest.bin -binary -unfill 0x00 16 -o ttytest.hex -mos_tech

ttytest.bin: ttytest.o
	$(CL) $(LFLAGS) -C kim-1.cfg -o ttytest.bin ttytest.o

ttytest.o: ttytest.a65
	$(CA) $(AFLAGS) -o ttytest.o ttytest.a65

clean:
	rm -f *.o *.bin *.bin.bak *.hex
