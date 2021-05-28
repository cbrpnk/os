#ifndef VGA_H
#define VGA_H

#include <stdint.h>

// 80 col by 25 lines, each chatacter is 2 bytes wide
//
//  Low addr    ---------------->    High addr
//    4bit   |  4bit  |      1 byte     
//  -------------------------------------
//  | bg_col | fg_col |   Ascii Code    |
//  -------------------------------------

#define VGA_MEM_START 0xb8000

#define VGA_BLACK 0x0
#define VGA_BLUE  0x1
#define VGA_GREEN 0x2
#define VGA_RED   0x4
#define VGA_GREY  0x8
#define VGA_WHITE 0xf

int vga_print(const char *str, uint8_t x, uint8_t y,
          uint8_t bg_col, uint8_t fg_col);

#endif
