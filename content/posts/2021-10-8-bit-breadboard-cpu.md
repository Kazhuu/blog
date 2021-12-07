---
title: "8-bit Breadboard Computer"
date: 2021-10-31T10:24:11+02:00
draft: true
---

This month I finally finished building my version of Ben Eater's 8-bit
breadboard computer. This computer is based on amazing work done by Ben Eater.
You can find more information about this project on his
[website](https://eater.net/8bit/). In this blog post I will give you a short summary
of the computer and how it works in a high level. I also describe my experience and some issues
I faced when building in the process. Below is a picture of my final build.

![computer](/cpu/computer.jpg)

I started working on this project back then when Ben was middle of doing the
video series and not yet selling building kits. Also there was no official
schematics available either. That meant I spend a lot of time watching the
videos and taking notes of the parts I need to order. In total this project has
taken more than 100 hours to complete, including studying, building and
troubleshooting.

You may ask why would you want build something like this? Here are couple of
things why I got so hooked into this in the first place:

* learn how CPU really works,
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
didn't fully understand. That might also be because I am a software developer and
not a hardware guy.

## Architecture

Below is picture of the architecture of
the computer and a table of its components and their explanation.

![Architecture](/cpu/architecture.png)

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
| ID | Instruction Decoder | Decode 4 bit instruction code in IR and control different part of the computer accordingly.
| Display | -- | Seven-segment display to display numbers.

Architecture of the computer consist of different components (rectangles) which are connected to each other by
data bus (blue arrows). Data bus is used to transport binary data between
different components and arrows signify the direction. Gray arrows are
interconnections between some of the components and are independent of the data
bus. On each clock cycle only one component can feed data to the bus and one or
more read from it. Orchestrating this is crucial for proper operation of the
computer. This is the job of instruction decoder which will control other
components when they feed data to bus or read from it. Instruction decoder
connects to all other components with control signals, which are all small incoming
arrows to each component in the picture above.

Data bus width is 8 bits and
some components only connect 4 [Least
Significant Bits (LSB)](https://en.wikipedia.org/wiki/Bit_numbering) to the data
bus. These 4 bits with Memory Address Register are used for addressing the
RAM.  Using only 4 bits for address means that computer can address only 16
bytes of RAM in total. This amount of RAM needs to contain both program
instructions and the program data.

Instruction register connects 4 LSB bits back to bus and 4 [Most Significant
Bits (MSB)](https://en.wikipedia.org/wiki/Bit_numbering) bits to instruction
decoder. 4 LSB bits are used for instruction parameter and 4 MSB bits are used for
instruction [opcode](https://en.wikipedia.org/wiki/Opcode) which are loaded to
instruction decoder. Instruction decoder is responsible of decoding the
current instruction and controlling other components using the control signals.

Instruction decoder behavior is programmed with
[microcode](https://en.wikipedia.org/wiki/Microcode). Microcode is responsible
for the logic how instructions are carried out with the available hardware.
Microcode consist of steps which get executed on following clock cycles after
currently executed instruction get loaded to the instruction register.  Thus
meaning that in theory each instruction can take different amount of clock
cycles to complete. However on this computer all instructions are fixed to be
executed in 6 clock cycles. On each step microcode will instruct the components
to do something. For example it can instruct RAM to output current address
content to the bus and A register to read it from the bus. On next clock cycle
it could change the RAM address and then on next clock cycle B register loaded
with pointed value from the RAM. These operations continue until the whole
instruction functionality is carried out and process begins again with loading a
new instruction using the program counter.

If you have already watched Ben's video series, you might notice that status
register is missing from my build. This is because I ordered the parts for this
build when that part of the video series was not done yet. At this point I considered my
project done already. I might come back to this in the future and
finish it. What this component allows is use of conditional jump instructions.
For example jump if not equal to zero.

I know I'm omitting a lot of details here but instead of repeating everything
here I recommend you to watch Ben's video series instead. A point here is to
give an overall picture of the architecture.

## Instructions

Machine instructions are 8 bits long. First 4 MSB bits are the
[opcode](https://en.wikipedia.org/wiki/Opcode) and last 4 LSB bits are an argument for
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
that will keep adding 3 in the endless loop. Comments are done with semicolon.

```
LDI 0   ;Load 0 to A register
ADD 15  ;Add value at address 15 to A register
OUT     ;Display A register value
JMP 1   ;Jump back to ADD 15 instruction
```

To be able to program this, we first need to convert our assembly to binary
code. This can be done by hand with table above. After the assembly process, the
program is shown in table below with the associated RAM addresses.  Execution of
the program in this computer always starts at address 0.

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
computer is done by manually setting the bits of each address using DIP
switches. Below how it looks in action.

![Add 3 in a loop](/cpu/add3.gif)

This will continue until the value overflows 255 and wraps back to 0. This is
due the hardware limit of using 8 bit registers.

At the moment computer only supports jump instruction and not conditional jumps.
This is due to missing status register hardware which is required. This is
missing from my build which I might add in the future as stated earlier.

## Power Delivery Problems

When doing your build, a power delivery can be an issue depending on the quality of the breadboards you are
using. Meaning that even when you supply 5V to the computer in one side. You will measure
around 3.5V on another side. This causes random logic level
failures like reading signal low even it is supposed to be high, random bit
flipping when poking the wires and the running program not working
reliably. This is caused by loose connections between the jumper wires and the
breadboard connectors. Multiply this effect many times and you will get a
noticeable voltage drop.

For my build I used the breadboards I ordered online labeled as BB830 brand from
BusBoard. Which are supposed to be high quality breadboards. Ben also explains about this breadboard in his video
[here](https://youtu.be/HtFro0UKqkk?t=794) and recommends them. Of course the
problem is the ones I ordered are not the real thing. These can be seen by not
aligned numbering of columns and not properly labeled rows.

Fortunately this problem is quite easy to fix. You need to replace
power jumper wire connections with wires soldered on header pins. You can see my
installation image below. Each header has two pins going into the breadboard to
secure a good connection.

![power lines](/cpu/power-wires.jpg)

The whole computer is surrounded by these soldered power lines. With this simple
change I was able to rise to voltage levels up to 4.7V from 3.5V. Then I was
able to run program loop more than 8 hours straight without any issues.

## Final Thoughts

As a software developer I really liked this project and it taught me a lot of
low level things that I was not fully aware of like CPU design and machine code.
After this project I can say I have much better understanding of the whole software
stack all way to the hardware. Also knowledge gained from this project has been
enormously helpful when I have studied hardware description languages like VHDL
and reading about low level CPU stuff like CPU design and how it operates.

As a final words I could not recommend this project enough for someone who want
to know how stuff works at deeper level. Ben's video series is quite amazingly
done and documented. One of the best things I have seen on YouTube. On top of
that he is also nowadays selling a ready made kit that makes the whole process
getting started so much easier.

And thank you for reading this far! Considered checking me out on GitHub and see
what other projects I have done.
