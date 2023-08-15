MEMORY
{
    BOOTROM (rx) : ORIGIN = 0x00000000, LENGTH = 0x004000
    APPROM (rx) : ORIGIN = 0x00004000, LENGTH = 0x3fc000
    RAM (xrw) : ORIGIN = 0x80000000, LENGTH = 0x20000
}

__bootrom_start__ = ORIGIN(BOOTROM);
__bootrom_size__ = LENGTH(BOOTROM);
__approm_start__ = ORIGIN(APPROM);
__approm_size__ = LENGTH(APPROM);
