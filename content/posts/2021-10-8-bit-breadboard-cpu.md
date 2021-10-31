---
title: "8-bit Breadboard Computer"
date: 2021-10-31T10:24:11+02:00
draft: true
---

This month I finally finished building my version of an 8-bit breadboard computer.
 This computer is based on amazing done by Ben Eater. More information on that
 you can find [here](https://eater.net/8bit/). In this blog post I will give you
summary of the computer, its instructions and also make it execute a simple program. I also describe my experience building this along the way.

Below is a picture of my
build.

![computer](/cpu/computer.jpg)

I started working on this project back then when Ben was doing the video series
and not selling ready made kits for builders. And there was no official schematics
available either. That meant I spend time watching the videos and noting the parts I need
to order myself. In total this project has taken more than 100 hours to get to
this point, including studying, building and troubleshooting.

You may ask why would you want build something like this? Here are couple of
things why I got so hooked into this in the first place:

* learn how CPU hardware works and what parts it consist of,
* learn how binary code is executed by the hardware,
* learn what microcode is and how it controls the different parts of the
    hardware,
* learn how bus data works,
* learn tons about logic gates, three-state logic, adders etc.

And the list goes on. In general if you want to learn CPU on low level.
This is very good project to try. You will get much better picture how
CPU operates in low level. Then when you read about more
advanced CPU features like instructions pipelining, they become easier to grasp. At
least that was the case for me that this project really helped me to understand
CPU hardware so much better as a software developer.

## Architecture

This computer has only 4 bits to address the RAM. That means, you only have 16 bytes of
RAM in total for the program and its data. Below is picture of architecture of
the computer. Photo is drawn by me but taken from Ben's video.

![Architecture](/cpu/architecture.png)

Different parts of the computer are connected by bus, which is used to transport
data between the components. Some components only connect 4 [least
significant bits (LSB)](https://en.wikipedia.org/wiki/Bit_numbering). This is because addressing is only 4 bits. Below is a table of acronyms and short explanation
for each.

| Acronym | Expanded | Explanation |
|---|---|---|
| MAR | Memory Address Register | 4 bit register to keep current RAM memory address.
| RAM | Random Access Memory | 16 bytes of memory for the program and its data.
| IR | Instruction Register | 8 bit register to keep currently executed instruction loaded from RAM.
| PC | Program Counter | 4 bit counter to hold address of currently executed instructions in RAM.
| A | A register | 8 bit register to hold first operand for addition and subtraction. Also will hold the result of the operation.
| B | B register | 8 bit register to hold the second operand for addition and subtraction.
| ALU | Arithmetic Logic Unit | Unit doing the addition or subtraction operation with content of A and B registers and put the result back to A register.
| OUT | Ouput register | 8 bit register to hold value to be displayed by seven-segment display.
| Display | -- | Seven-segment display to display numbers.

If you already watched Ben's video series you might notice that status register
is missing from my build. This is because I ordered the parts for this build
when that part was not finished yet. Thus I did not have the parts and
considered my project done already at this point.

## Instructions

Machine instructions are 8 bits long. First four bits are the
[opcode](https://en.wikipedia.org/wiki/Opcode) and last four are an argument for
that instruction. Not all instructions take argument. Below is a table of all
instructions that computer supports. `XXXX` means that that instruction does not
take argument and bits does not matter.

| Mnemonic | Opcode | Parameter | Explanation |
|---|---|---|---|
| NOP | 0000 | XXXX | No operation (no-op) |
| LDA | 0001 | Address | Load value from Address to A register |
| ADD | 0010 | Address | Add value at Address to value in A register, store result in A register |
| SUB | 0011 | Address | Subtract value at Address from value in A register, store result in A register |
| STA | 0100 | Address | Store content of A register to Address |
| LDI | 0101 | Immediate | Load Immediate to A register |
| JMP | 0110 | Address | Jump execution to Address |
| OUT | 1110 | XXXX | Display content of A register  |
| HLT | 1111 | XXXX | Halt the computer and stop execution |

## Simple Program

Show simple program and walk through it.

## Things I Changed

Explain better power lines because of bad quality breadboards.

## Final Thoughts

What I felt and liked about this.
