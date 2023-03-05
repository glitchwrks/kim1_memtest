Glitch Works KIM-1 Memory Tests
-------------------------------

Memory tests for the [MOS KIM-1](https://en.wikipedia.org/wiki/KIM-1). This repository contains a number of different tests:

TTY Test
--------

This is a port of the OSI memory test for KIM-1 memory layout and serial I/O. `ttytest` runs on the bit-bang serial interface included with the KIM-1. The `Makefile` target generates a MOS formatted hex file, which can be loaded into the KIM-1 using the built-in monitor `L` command. Interaction with the test is via serial. The test loads in at `0x0200` and fits in the onboard 1K of RAM on the KIM-1.

This test is primarily used to check out expansion memory on KIM-1s. Running the test below `0x0400` will clobber the test! Commands are:

#### Test Memory 

Syntax `T:<start>,<end>`

Example: enter `T040013FF` to test 4K of memory above the base onboard RAM. A cycle count will be displayed, and an `X` will be printed ever 255 cycles.

If an error is encountered, the address will be displayed with the expected and actual content. Hit `<CR>` to restart the program.

#### Load Memory 

Syntax: `L:<start>,<end>=<data>`

Example: enter `L040013FFFF` to fill 4K of memory above the base onboard RAM with `0xFF`.
 
A splat `*` is printed on completion, hit `<CR>` to restart the program.

#### Compare Memory 

Syntax `C:<start>,<end>=<data>`

Example: enter `C040013FFFF` to check if the 4K of memory above the base onboard RAM contains all `0xFF`.

Errors are reported as with the `T` command. Hit `<CR>` to restart the program.

Building
--------

Assemble by running `make`. You'll need the [CC65 package](https://cc65.github.io/), [srecord](https://srecord.sourceforge.net/), and a working Perl.
