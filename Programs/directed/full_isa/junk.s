.section .text
    .globl _start

_start:

    # li a0, 0x11
    # li a1, 0x22
    # li a2, 0x33
    # li a3, 0x44
    # li gp, 0x18000
    # sb a0, 12(gp)
    # sb a1, 13(gp)
    # sb a2, 14(gp)
    # sb a3, 15(gp)
    # li a0, 0xAAAA
    # li a1, 0xFFFF
    # sh a0, 16(gp)
    # sh a1, 18(gp)
    # li a0, 0xBEAFCAFE
    # sw a0, 20(gp)

    # li a0, 0
    # li gp, 0x22A00

    # li t0, 0
    # li t1, 19200
    # for_begin:  #for(ii = 0; ii < 0x4B00; ii++)
    #     bge t0, t1, for_end

    #     sh a0, 0(gp)    #write to vram
    #     addi a0, a0, 1  #increment write_val
    #     addi gp, gp, 2  #increment vram ptr

    #     addi t0, t0, 1  #inc ii
    #     j for_begin
    # for_end:

    # li a0, 0xFFFF
    # li gp, 0x22A00
    # sh a0, 0(gp)
    # li t1, 19199
    # slli t1, t1, 1
    # add gp, gp, t1
    # li a0, 0x0F00
    # sh a0, 0(gp)
    # add a0, zero, gp

    nop
    nop
    nop
    nop
    nop
    ebreak        
    nop
    nop
    nop
    nop
    nop
