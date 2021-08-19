SECTIONS
{
    /* Sometimes, the new DOL section injected by C-Kit is within reach of SDA_BASE and SDA2_BASE.       */
    /* To capitalize on this miracle, we will tell the linker to put these sections first when linking.  */
    .sdata : 
    {
        *(.sdata)
    }
    .sbss : 
    {
        *(.sbss)
    }
    .sdata2 : 
    {
        *(.sdata2)
    }
    .sbss2 : 
    {
        *(.sbss2)
    }
    /* All of these other sections usually follow this order, excluding .sdata/2 and .sbss/2, obviously. */
    /* These must be explicitely ordered, or else the linker will start making assumptions.              */
    .init : 
    {
        *(.init)
    }
    extab : 
    {
        *(extab)
    }
    extabindex : 
    {
        *(extabindex)
    }
    .text : 
    {
        *(.text)
    }
    .ctors : 
    {
        *(.ctors)
    }
    .dtors : 
    {
        *(.dtors)
    }
    .rodata : 
    {
        *(.rodata)
    }
	.data :
	{
		*(.data)
	}
	.bss :
	{
		*(.bss)
	}
}
