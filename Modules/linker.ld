ENTRY(_start)

STACK_SIZE = 4K;
MIN_HEAP_SIZE = 1K;
VRAM_SIZE = 38400;

MEMORY
{   /*dmem is 80k - framebuffer len*/
    IMEM (rx)  : ORIGIN = 0x00000000, LENGTH = 96K
    DMEM (rw)  : ORIGIN = 0x00018000, LENGTH = (80K - VRAM_SIZE)
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

    /* if this is outsiode the .bss{} block, then when dmem is */
    /* empty the pointer is incorrect and ends up in imem */
        _heap_start = .; 
    } > DMEM

    /* dmem top as seen by linker is 0x22A00, actual is 0x22C00 */
    _actual_dmem_top = VRAM_SIZE + ORIGIN(DMEM) + LENGTH(DMEM);

    _vram_top = VRAM_SIZE + ORIGIN(DMEM) + LENGTH(DMEM);
    _vram_bottom = ORIGIN(DMEM) + LENGTH(DMEM);
    _vram_size = _vram_top - _vram_bottom;

    /* fixed stack boundries */
    _stack_top    = ORIGIN(DMEM) + LENGTH(DMEM);
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
}
