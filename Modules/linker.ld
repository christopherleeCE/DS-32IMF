ENTRY(_start)

STACK_SIZE = 8K;
MIN_HEAP_SIZE = 2K;
VRAM_START = 0x22A00;
VRAM_SIZE  = 0x9600;
VRAM_END   = VRAM_START + VRAM_SIZE;
TRAM_END = 0X22A00;
TRAM_SIZE = 0x170;
TRAM_START = TRAM_END - TRAM_SIZE;

MEMORY
{   /*dmem is 80k - framebuffer len*/
    IMEM (rx)  : ORIGIN = 0x00000000, LENGTH = 0x18000
    DMEM (rw)  : ORIGIN = 0x00018000, LENGTH = 0x14000
}

SECTIONS
{
    .text : {
        *(.text*)
    } > IMEM

    .rodata : {
        *(.rodata*)
        *(.srodata*)
    } > DMEM

    .data : {
        *(.data*)
        *(.sdata*)
    } > DMEM

    .bss : {
        *(.sbss*)
        *(.bss*)
        *(COMMON)

        /* word allign */
        . = ALIGN(4);

        /* if this is outsiode the .bss{} block,
        then when dmem is empty the pointer is
        incorrect and ends up in imem */
        _heap_start = .; 

    } > DMEM

    /* supposedly keep() prevents linker garbage collection */
    .tram TRAM_START : {
        KEEP(*(.tram))
    } > DMEM
    .vram VRAM_START : {
        KEEP(*(.vram))
    } > DMEM

    _actual_dmem_top = ORIGIN(DMEM) + LENGTH(DMEM);

    _vram_top = VRAM_END;
    _vram_bottom = VRAM_SIZE;
    _vram_size = VRAM_START;

    _tram_top = TRAM_END;
    _tram_bottom = TRAM_SIZE;
    _tram_size = TRAM_START;

    /* fixed stack boundries */
    _stack_top    = TRAM_START;
    _stack_bottom = _stack_top - STACK_SIZE;
    _stack_size = _stack_top - _stack_bottom;

    /* heap ends at stack boundry */
    _heap_end = _stack_bottom;
    _heap_start = _heap_start;
    _heap_size = _heap_end - _heap_start;

    _dmem_origin = ORIGIN(DMEM);

    /* check for min stack allocation being met */
    ASSERT(_heap_end >= _heap_start,
        "ERROR: DMEM overflow: data + stack exceed available RAM")
    /* check for min heap allocation being met */
    ASSERT((_heap_end - _heap_start) >= MIN_HEAP_SIZE,
        "ERROR: Heap smaller than minimum threshold")
    /* check for vram overflow */
    ASSERT(SIZEOF(.vram) <= VRAM_SIZE,
        "ERROR: VRAM section exceeds reserved VRAM size")
    /* check for tram overflow */
    ASSERT(SIZEOF(.tram) <= TRAM_SIZE,
        "ERROR: TRAM section exceeds reserved TRAM size")
}
