#include <stdint.h>

#include "vga.h"

/* TODO
  - [ ] Make sure the Bootlaoder loads the full kernel, not just the 2nd sector
  - [ ] Make continuous outputing to screen
  - [ ] Control cursor position
  - [ ] Screen scrolling
  - [ ] Keyboard input
  - [ ] Test on real hardware
*/

// Sets up the interup descriptor table
int idt_setup()
{
    
    return 0;
}

int main()
{
    // Welcome message
    vga_print("Manux V0.0.1", 0, 0, VGA_BLACK, VGA_GREEN);
    
    // IDT
    vga_print("Setting up IDT...", 0, 1, VGA_BLACK, VGA_WHITE);
    if(idt_setup() == 0) {
        vga_print("[OK]", 17, 1, VGA_BLACK, VGA_WHITE);
    } else {
        vga_print("[ERROR]", 17, 1, VGA_BLACK, VGA_WHITE);
    }
    
    return 0;
}
