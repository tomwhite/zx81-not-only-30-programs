# Not Only 30 Programs for the Sinclair ZX81

Run the programs from this classic book in your browser, or load them onto a real ZX81.

![Not Only 30 Programs for the Sinclair ZX81 front cover](web/NotOnly30ProgramsForTheSinclairZX81.Front.jpg)

## How this site was built

I transcribed the ZX81 programs from a PDF copy of [Not Only 30 Programs for the Sinclair ZX81](https://archive.org/download/30-programs-for-the-zx-81-1-kacme/30_programs_for_the_ZX81_1K%28acme%29.pdf). (There is a [text version](http://amigan.1emu.net/aw/not30.txt) available too.)

The programs are saved in text format with a `.bas` file extension. Graphics characters and inverse video characters are represented using the conventions described in [ZXText2P](http://freestuff.grok.co.uk/zxtext2p/index.html). The sequence `\::`, for example, represents a black square.

The `zxtext2p` command was used to convert these text files to ZX81 P files suitable for use in an emulator, or a real ZX81. For example:

```bash
~/sw/zxtext2p/zxtext2p -o web/images/craps.p src/craps.bas
xxd -p web/images/craps.p | tr -d '\n' > web/images/craps.p.hex
```

Or just run the following to convert all files:

```bash
make
```

The web pages use the excellent [JtyOne Online ZX81 Editor](https://www.zx81stuff.org.uk/zx81/jtyone.html) to run the programs.

## Notes on the programs

### Noughts and crosses

As the book says "its logic is fairly well hidden and the use of variables in the listing makes it difficult to know what is happening".
This is as a result of getting it to work in under 1K of memory.

It turns out that it doesn't work on a ZX81 with 16K because of the way it uses the display file. The 1K ZX81 has a compressed representation, where blank characters are skipped - so a blank screen is just a series of newlines. (This is mentioned in Chapter 27 of the ZX81 manual.) With a 16K memory extension this optimisation is not needed, and all characters on the screen can be stored, even blank ones.

If we look at the program's display routine, from line 400, we see that line 420 finds the address of the display file by `PEEK`ing the `D_FILE` system variable at address 16396 and 16397.

Line 440 then looks at all positions in the display file memory (it is looping over `I`) and if any are the number being searched for (`R`, which can be between 1 and 8) then that memory address is set (by a `POKE` command) to `O` (52) or `X` (61).

The trouble is that the loop at line 430 is only looping to `Z*B + B`, which since `Z=4` and `B=8` is only 40 characters, which suffices for the compressed display of the 1K ZX81, but on a 16K machine it won't check enough of the display file before exiting to loop. This means tht not all of the board is searched, and the game doesn't work properly.

<!-- I had to convert the text file to P, open in an emulator, define the variables (`X`, `Y`, `Z`, `B`, and `S` as described in the text), then resave the image as a P file. This works because the P file contains a copy of the variables in memory. -->

### Pinch

The program never terminates (by quick inspection). Not sure if the logic is correct in all cases.

### Battleships

The program doesn't check if the battleships overlap, so there can be less than 8 `X` positions, so it doesn't terminate properly since the number of hits never reaches 8. However, it also doesn't check if you have already found an `X` so you can just repeat a previous position and it counts as a new hit!

### Craps

Escaping quotes in quotes needs `\"` for `zxtext2p`, rather than `""` as on the ZX81 keyboard (shift Q).

## TODO

- Eliminate hex files (js can just load P files directly into arrays)

## Copyright and License

The programs are copyright (c) 1981 by Beam Software.

The emulator is subject to the GPL license, version 2. See https://www.zx81stuff.org.uk/zx81/jtyone.html
