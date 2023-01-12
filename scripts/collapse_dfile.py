#!/usr/bin/python

# Script to collapse the display file in a ZX81 P file so that it can fit on a 1K ZX81.
#
# Portions are from https://github.com/michaelcmartin/bumbershoot/blob/master/zx81/zx81link.py

import sys

def read_word(b, offset):
    lo = b[offset]
    hi = b[offset+1]
    return lo + 256 * hi

if __name__ == "__main__":
    infile = sys.argv[1]
    outfile = sys.argv[2]
    p_bytes = open(infile, "rb").read()

    # find offsets of display file, variables, and E_LINE
    d_file = read_word(p_bytes, 3)
    vars = read_word(p_bytes, 7)
    e_line = read_word(p_bytes, 11)

    sys_var_start = 16393
    program_start = 16509

    program_offset = program_start - sys_var_start
    d_file_offset = d_file - sys_var_start
    vars_offset = vars - sys_var_start

    sys_var_len = program_start - sys_var_start
    program_len = d_file - program_start
    d_file_len = vars - d_file
    vars_len = e_line - vars - 1

    # extract bytes for each region
    sys_vars = list(p_bytes[:sys_var_len])
    program = p_bytes[program_offset:program_offset+program_len]
    display_file = b'\x76' * 25  # collapsed
    variables = p_bytes[vars_offset:vars_offset+vars_len]

    # update addresses
    df_cc = d_file + 1
    var_ptr = d_file + len(display_file)
    e_line = var_ptr + 1 + len(variables)
    ch_add = e_line + 4
    stkbot = ch_add + 1
    stkend = stkbot
    offsets = [3, 5, 7, 11, 13, 17, 19]
    values = [d_file, df_cc, var_ptr, e_line, ch_add, stkbot, stkend]
    for v, o in zip(values, offsets):
        l = v & 0xff
        h = (v >> 8) & 0xff
        sys_vars[o] = l
        sys_vars[o+1] = h

    # construct P file
    output = bytearray(sys_vars)
    output += program
    output += display_file
    output += variables
    output += b'\x80'  # terminator

    # write out
    with open(outfile, "wb") as of:
        of.write(output)
        of.close()