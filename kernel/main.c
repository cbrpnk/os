#include <stdint.h>

/* TODO
  - [ ] Make sure the Bootlaoder loads the full kernel, not just the 2nd sector
  - [ ] Make continuous outputing to screen
  - [ ] Control cursor position
  - [ ] Screen scrolling
  - [ ] Keyboard input
  - [ ] Test on real hardware
*/

#define VGA_BUFFER_ADDR 0xb8000

#define VGA_FG_BACK  0x00
#define VGA_FG_BLUE  0x01
#define VGA_FG_GREEN 0x02
#define VGA_FG_RED   0x04
#define VGA_FG_GREY  0x08
#define VGA_FG_WHITE 0x0f

#define VGA_BG_BLACK 0x00
#define VGA_BG_BLUE  0x10
#define VGA_BG_GREEN 0x20
#define VGA_BG_RED   0x40
#define VGA_BG_GREY  0x80
#define VGA_BG_WHITE 0xf0

int print(const char *str, uint8_t col)
{
    uint16_t *vga = (uint16_t *) VGA_BUFFER_ADDR;
    const char *c = str;
    
    while(*c != 0) {
        *vga = (((uint16_t) col) << 8) | *c;
        ++vga;
        ++c;
    }
    
    return 0;
}

int main()
{
    print("MANUX V0.0.1", VGA_FG_GREEN);
    return 0;
}
