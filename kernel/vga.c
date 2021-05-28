#include "vga.h"

int vga_print(const char *str, uint8_t x, uint8_t y,
              uint8_t bg_col, uint8_t fg_col)
{
    uint16_t *vga = (uint16_t *) VGA_MEM_START + (x + y*80);
    uint8_t col = (bg_col << 4) | fg_col;
    
    while(*str != 0) {
        *vga = (((uint16_t) col) << 8) | *str;
        ++vga;
        ++str;
    }
    
    return 0;
}
