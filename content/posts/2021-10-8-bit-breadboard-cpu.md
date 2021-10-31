---
title: "8-bit Breadboard Computer"
date: 2021-10-31T10:24:11+02:00
draft: true
---

This month I finally finished building my version of an 8-bit breadboard computer.
 This computer is based on amazing tutorial made by Ben Eater,
which you can find [here](https://eater.net/8bit/).

![computer](/cpu/computer.jpg)

You may ask why you want to build this? Here are couple of things why I set out
to do this:

* Learn how CPU hardware is actually operated by instructions
* Learn about different parts of the CPU architecture, like program counter,
    registers etc.

## Architecture

Picture of architecture and small explanation

![Architecture](/cpu/architecture.png)


## Instructions

| Mnemonic | Opcode | Parameter | Explanation                                                                    |
|----------|--------|-----------|--------------------------------------------------------------------------------|
| NOP      | 0000   | XXXX      | No operation (no-op)                                                           |
| LDA      | 0001   | Address   | Load value from Address to A register                                          |
| ADD      | 0010   | Address   | Add value at Address to value in A register, store result in A register        |
| SUB      | 0011   | Address   | Subtract value at Address from value in A register, store result in A register |
| STA      | 0100   | Address   | Store content of A register to Address                                         |
| LDI      | 0101   | Immediate | Load Immediate to A register                                                   |
| JMP      | 0110   | Address   | Jump execution to Address                                                      |
| OUT      | 1110   | XXXX      | Display content of A register                                                  |
| HLT      | 1111   | XXXX      | Halt the computer and stop execution                                           |

## Simple Program

Show simple program and walk through it.

## Things I Changed

Explain better power lines because of bad quality breadboards.

## Final Thoughts

What I felt and liked about this.
