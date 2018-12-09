#ifndef _MEMORY_H_
#define _MEMORY_H_

extern int frames;
extern char scroll_x;
extern char scroll_y;

typedef struct sprite {
  char y;
  char id;
  char flags;
  char x;
} sprite_t;

#define SPRITES (0x200)
#define SPRITE ((sprite_t volatile[64])SPRITES)

#define SPRITE_PALETTE (0)
#define SPRITE_PRIORITY (1<<5)
#define SPRITE_FLIP_HORIZONTAL (1<<6)
#define SPRITE_FLIP_VERTICAL (1<<7)

#endif
