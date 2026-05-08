#!/usr/bin/env python3
#individual entries, addr : content
#range entries, [start..end_inclusive] : contents
#for sumreason 96k and 80k blks respectively round up to 128k, idk

import argparse

def gen_raw_mif(lst, width, depth, words):
    lst.append(f"WIDTH={width};")
    lst.append(f"DEPTH={depth};")
    lst.append("")
    lst.append("ADDRESS_RADIX=HEX;")
    lst.append("DATA_RADIX=HEX;")
    lst.append("")
    lst.append("CONTENT BEGIN")

    # lst.append(f"[0..{len(words):X}] : DEAD;\n")
    for addr, word in enumerate(words):
        lst.append((addr, int(word, 16)))

    if depth > len(words):
        lst.append(f"[{len(words):X}..{depth-1:X}] : 0;\n")

    lst.append("END;")

def coeless_mif(raw_list):

    ret_list = []

    #init header
    ret_list.append(raw_list[0])
    ret_list.append(raw_list[1])
    ret_list.append(raw_list[2])
    ret_list.append(raw_list[3])
    ret_list.append(raw_list[4])
    ret_list.append(raw_list[5])
    ret_list.append(raw_list[6])
    
    start_addr = raw_list[7][0]
    start_cont = raw_list[7][1]
    end_addr = 0

    # print("first start")
    # print(f"{start_addr}, {start_cont}")

    for ii in range(7, len(raw_list)):
        curr_addr = raw_list[ii][0]
        curr_cont = raw_list[ii][1]
        # input()
        # print(f"start_cont, curr_cont: {start_cont}, {curr_cont}"); 

        if(start_cont != curr_cont):
            if(start_addr == end_addr):
                ret_list.append(f"{start_addr:X} : {start_cont:X};")
                # print(f"writing: {start_addr:X} : {start_cont:X};")

            else:
                ret_list.append(f"[{start_addr:X}..{end_addr:X}] : {start_cont:X};")
                # print(f"writing: [{start_addr:X}..{end_addr:X}] : {start_cont:X};")

            start_addr = curr_addr
            start_cont = curr_cont
            end_addr = curr_addr

        else:
            end_addr = curr_addr

    #append with END
    ret_list.append(raw_list[len(raw_list)-1])

    # for ret in ret_list:
    #     print(ret)

    return ret_list



def hex2mif(input_file, output_file, width=32, depth=None):
    words = []

    with open(input_file, "r") as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            words.append(line)

    if depth is None:
        depth = len(words)

    #generate raw .mif in a list
    lines_pre_process = []
    gen_raw_mif(lines_pre_process, width, depth, words)

    #coeless raw.mif, and write to out.mif
    lines_post_process = coeless_mif(lines_pre_process)
    with open(output_file, "w") as f:
        for pp_line in lines_post_process:
            f.write(f"{pp_line}\n")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Convert plain hex words to .mif")
    parser.add_argument("input", help="input hex file (one 32-bit word per line)")
    parser.add_argument("output", help="output .mif file")
    parser.add_argument("--width", type=int, default=32, help="word width (default 32), only writes to .mif header, leave empty or 32")
    parser.add_argument("--depth", type=int, help="memory depth (default = number of lines), leave empty")

    args = parser.parse_args()

    hex2mif(args.input, args.output, args.width, args.depth)