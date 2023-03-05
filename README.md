Glitch Works KIM-1 Memory Tests
-------------------------------

Memory tests for the [MOS KIM-1](https://en.wikipedia.org/wiki/KIM-1). This repository contains a number of different tests:

### TTY Test

`ttytest` runs on the bit-bang serial interface included with the KIM-1. The `Makefile` target generates a MOS formatted hex file, which can be loaded into the KIM-1 using the built-in monitor `L` command. Interaction with the test is via serial. The test loads in at `0x0200` and fits in the onboard 1K of RAM on the KIM-1.

This test is primarily used to check out expansion memory on KIM-1s.

### Building

Assemble by running `make`. You'll need the [CC65 package](https://cc65.github.io/), [srecord](https://srecord.sourceforge.net/), and a working Perl.
