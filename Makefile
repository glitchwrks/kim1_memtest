AFLAGS		= -t none
LFLAGS		= -t none
RMFLAGS		= -f
 
CC		= cc65
CA		= ca65
CL		= cl65
RM		= rm

all: clean ttytest.bin

memtest.o: memtest.a65
	$(CA) $(AFLAGS) -o memtest.o memtest.a65

memtest.bin: memtest.o
	$(CL) $(LFLAGS) -C kim-1.cfg -o memtest.bin memtest.o

ttytest.o: memtest.a65
	$(CA) $(AFLAGS) -o ttytest.o ttytest.a65

ttytest.bin: ttytest.o
	$(CL) $(LFLAGS) -C kim-1.cfg -o ttytest.bin ttytest.o

clean:
	$(RM) $(RMFLAGS) *.o *.bin *.bin.bak
