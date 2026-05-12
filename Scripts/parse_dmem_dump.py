#!/usr/bin/env python3

import argparse
import os

def parse_hex(input_file, output_file):

    tmp_lines = []
    # cnt = 0
    with open(input_file, "r") as fin:
        for _ in range(3): #skip header lines
            next(fin, None)

        words = []

        for line in fin:
            # cnt = cnt + 1
            line = line.strip()
            if not line:
                continue

            words.append(line)

    # print(f"cnt:{cnt}")
    # print(f"len(words):{len(words)}")

    if(len(words) > int(0x14000/4)):

        for _ in range(int(0x14000/4), len(words)):
            if(words[-1] == "00000000"):
                words.pop()
            else:
                os.remove(output_file)
                raise Exception("Non-Zero found out of address space")

    # print(f"len(words):{len(words)}")

    addr = 0x18000
    for word in words:
        if(addr % 16 == 0):
            tmp_lines.append("\n")
        #tmp_lines.append(f"0x[{addr+3:04X} {addr+2:04X} {addr+1:04X} {addr:04X}] : 0x[{word[0:2]} {word[2:4]} {word[4:6]} {word[6:8]}]")
        tmp_lines.append(f"0x[{addr:04X}] : 0x[{word[0:2]} {word[2:4]} {word[4:6]} {word[6:8]}]")
        tmp_lines.append("\t")
        addr = addr + 4

    with open(output_file, "w") as fout:
        for line in reversed(tmp_lines):
            fout.write(line)
            #fout.write(input_file)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Parses .hex dump to byte table with abs address, hardcoded infile and outfile")
    #parser.add_argument("input", help="input hex file (one 32-bit word per line)")
    #parser.add_argument("output", help="output .mif file")
    args = parser.parse_args()

    parse_hex("./dump/dmem_dut_dump.hex", "./dump/dmem_dut_dump.log")
    parse_hex("./dump/dmem_gold_dump.hex", "./dump/dmem_gold_dump.log")