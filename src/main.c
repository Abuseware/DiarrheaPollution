#include <nes.h>
#include <memory.h>

#include <joker_nametable.h>


const unsigned char *palette, *nametable;


void LoadPalette(void) {
  char i;

  PPU.vram.address = 0x3f;
  PPU.vram.address = 0;

  for(i = 0; i < 32; ++i) {
    PPU.vram.data = palette[i % 16];
  }
}

void LoadNameTable(char id) {
  int i;
  switch(id) {
    case 0:
      PPU.vram.address = 0x20;
      break;
    case 1:
      PPU.vram.address = 0x24;
      break;
  }
  PPU.vram.address = 0;

  for(i = 0; i < 1024; ++i) {
    PPU.vram.data = nametable[i];
  }
}

void Setup(void) {
  palette = joker_palette;
  LoadPalette();
  nametable = joker_nametable;
  LoadNameTable(0);
  LoadNameTable(1);
  SPRITE[0].x = 8;
  SPRITE[0].y = 8;
  SPRITE[0].id = 0;
  SPRITE[0].flags = 0;

  SPRITE[1].x = 0xff / 2 - 4;
  SPRITE[1].y = 0xef / 2 - 4;
  SPRITE[1].id = 0;
  SPRITE[1].flags = 1;

}

void MainLoop(void) {
  char vector;

  if(frames & 1) {
      ++scroll_x;
  }

  switch(vector){
    case 0:
      if(++SPRITE[0].x >= 0xff - 16) {
        vector = 1;
        SPRITE[0].flags = vector;
      }
      break;
    case 1:
      if(++SPRITE[0].y >= 0xef - 16) {
        vector = 2;
        SPRITE[0].flags = vector;
      }
      break;
    case 2:
      if(--SPRITE[0].x <= 0x8) {
        vector = 3;
        SPRITE[0].flags = vector;
      }
      break;
    case 3:
      if(--SPRITE[0].y <= 0x8) {
        vector = 0;
        SPRITE[0].flags = vector;
      }
      break;
  }

}
