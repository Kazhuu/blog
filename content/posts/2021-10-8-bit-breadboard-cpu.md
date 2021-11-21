---
title: "8-bit Breadboard Computer"
date: 2021-10-31T10:24:11+02:00
draft: true
---

This month I finally finished building my version of Ben Eater's 8-bit
breadboard computer. This computer is based on amazing work done by Ben Eater.
More information about this project you can find on his
[website](https://eater.net/8bit/). In this blog post I will give you a summary
of the computer and how it works.  I also describe my experience and some issues
I faced when building this.  Below is a picture of my build.

![computer](/cpu/computer.jpg)

I started working on this project back then when Ben was middle of doing the
video series and not yet selling building kits. Also there was no official
schematics available either. That meant I spend a lot of time watching the
videos and taking notes of the parts I need to order. In total this project has
taken more than 100 hours to complete, including studying, building and
troubleshooting.

You may ask why would you want build something like this? Here are couple of
things why I got so hooked into this in the first place:

* learn how CPU works on low level,
* learn about microcode and what it is,
* learn how binary code is actually executed by the hardware,
* you will have much better picture of the whole software stack all way to the
    hardware,
* and learn about logic gates, three-state logic, adders etc.

And the list goes on. In general if you want to learn CPU on low level, this is
very good project to give a try. You will get much better picture how CPU
operates in general. Then when you read about more advanced CPU features like
instruction pipelining, they become easier to grasp. At least that was the case
for me that this project really helped me to fill the knowledge gaps that I
didn't fully understand.

## Architecture

TODO: Finish this section

Below is picture of the architecture of
the computer. Photo is drawn by me but taken from Ben's video.

![Architecture](/cpu/architecture.png)

Architecture of the CPU consist of different parts connected to each other by
data bus. Data bus is used to transport data between different components.
Arrows in the picture show the direction the data can move to.  For proper
operation of the CPU, only one component feed data to the bus and one will read
it. Orchestrating this is done by `Instruction Decoder` and
[microcode](https://en.wikipedia.org/wiki/Microcode). Below is table of
different parts of the computer and their explanation.

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

Full bus connection is 8 bits and
some components only connect 4 [least
significant bits (LSB)](https://en.wikipedia.org/wiki/Bit_numbering). These 4
LSB bits with `Memory Address Register` and `Program Counter` are used for
addressing the RAM. Four bits from `Instruction Register` are used for
instruction parameter. Using 4 bits for address means that computer can address
only 16 bytes of RAM. This RAM needs to contain both program instructions and
program data.



This computer has only 4 bits to address the RAM. This means, you only have 16 bytes of
RAM in total for the program and its data. 

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

| Mnemonic | Opcode | Argument | Explanation |
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

With above simple instructions you could for example write a simple program
that will keep adding 3 in the endless loop.

```
LDI 0   ;Load 0 to A register
ADD 15  ;Add value at address 15 to A register
OUT     ;Display A register value
JMP 1   ;Jump back to ADD 15 instruction
```

To program this we need to program RAM according the table below.
Execution always starts at address 0.

| Address | Value | Instruction |
|---|---|---|
| 0 | 0101 0000 | LDI 0 |
| 1 | 0010 1111 | ADD 15 |
| 2 | 1110 0000 | OUT |
| 3 | 0110 0001 | JMP 1 |
| ... | ... | ... |
| 15 | 0000 0011 | Value 3 loaded by ADD 15 instruction |

Notice we need to set address 15 to have the value used by `ADD 15` instruction.
Other addresses does not matter because they will never be read. Programming the
computer is done by manually setting the bits of each address using DIP switches. Below how it looks like when working correctly.

![Add 3 in a loop](/cpu/add3.gif)

## Power Delivery Problems

Power delivery can be an issue depending on quality of the breadboards you are
using. Meaning that even you supply 5V to the computer in one side. You will measure
around 3.5V on another side. This causes random logic level
failures like reading signal low even it is supposed to be high, random bit
flipping when poking the wires and the running program not working
reliably. This is caused
by loose connections between the jumper wires and the breadboard connectors.
Multiply this effect many times and you will get a noticeable voltage drop.

For my build I used the breadboards I ordered online labeled as BB830 brand from
BusBoard. Which are supposed to be high quality breadboards. Ben also explains about this breadboard in his video
[here](https://youtu.be/HtFro0UKqkk?t=794) and recommends them. Of course the
problem is the ones I ordered are not the real thing. These can be seen by not
aligned numbering of columns and not properly labeled rows.

Fortunately this problem is quite easy to fix. You need to replace
power jumper wire connections with wires soldered on header pins. You can see my
installation image below.

![power lines](/cpu/power-wires.jpg)

The whole computer is surrounded by these soldered lines. With this simple
change I was able to rise to voltage levels up to 4.7V from 3.5V. Then I was
able to run program loop more than 8 hours straight without any issues.

## Final Thoughts

As a software developer I really liked this project and it taught me a lot of
low level things that I was not fully aware of like CPU design and machine code.
After this project I can say I have much better picture of the whole software
stack all way to the hardware. Also knowledge gained from this project has been
enormously helpful when I have studied hardware description language like VHDL
and reading about low level CPU stuff like CPU design and how it operates.

As a final words I could not recommend this project enough for someone who want
to know how stuff works at deeper level. Ben's video series is quite amazingly
done and documented. Also nowadays selling a ready made kit makes the whole
process getting started so much easier.

And thank you for reading this far!
