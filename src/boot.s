.include "nes.inc"
.include "memory.inc"

.include "lib/nsf/driver.s"
.include "assets/music.asm"

.segment "HEADER"
; NROM-256
.byte $4e,$45,$53,$1a ;0-3
.byte 2 ; PRG ROM size 2x ;4
.byte 1 ; CHR size ;5
.byte 1 ; 0 - horizontal mirror, 1 - vertical ;6
.byte 2<<2 ; NES 2.0 2<<2 ;7
.byte 0 ; Mapper ;8
.byte 0 ; chr/prog size 2 ; 9
.byte 7 ; RAM ; 10
.byte 0 ; VRAM ; 11
.byte 0 ; 1 - PAL, 0 - NTSC, 1/3 - dual ;12
.res 3, 0

.segment "RODATA"
palette: .incbin "assets/joker.dat"
joker: .incbin "assets/joker.nam"

.segment "ZEROPAGE"
ptr:
ptrLow: .res 1
ptrHigh: .res 1

busy: .res 1

.segment "DATA"
_frames:
_framesLow: .res 1
_framesHigh: .res 1

_scroll_x: .res 1
_scroll_y: .res 1

.segment "STARTUP"
reset:
  sei
  cld
  ldx #$40
  stx APU_PAD2 ; disable APU frame IRQ
  ldx #$ff
  txs ; Set up stack
  inx ; now X = 0
  stx PPU_CTRL1 ; disable NMI
  stx PPU_CTRL2 ; disable rendering
  stx APU_MODCTRL ; disable DMC IRQs

  bit PPU_STATUS ; clear vblank
  jsr VBlankWait

  @ClearMem:
    lda #0
    sta $000, x
    sta $100, x
    sta $200, x
    sta $300, x
    sta $400, x
    sta $500, x
    sta $600, x
    sta $700, x

    sta $6000, x
    sta $6100, x
    sta $6200, x
    sta $6300, x
    sta $6400, x
    sta $6500, x
    sta $6600, x
    sta $6700, x
    sta $6800, x
    sta $6900, x

    sta $7000, x
    sta $7100, x
    sta $7200, x
    sta $7300, x
    sta $7400, x
    sta $7500, x
    sta $7600, x
    sta $7700, x
    sta $7800, x
    sta $7900, x

    lda #$fe
    sta $200, x

    inx
    bne @ClearMem

  jsr VBlankWait

  jsr _Setup

  lda #0
  jsr ft_music_init

  ;enable NMI, sprites 1, bg 0
  lda #(1<<7 | 1<<4)
  sta PPU_CTRL1

  ;enable rendering
  lda #(1<<4 | 1<<3 | 1<<2 | 1<<1)
  sta PPU_CTRL2

  @loop:
  jsr _MainLoop
  lda #1
  sta busy
  @wait:
  lda #1
  cmp busy
  beq @wait
  jmp @loop


VBlankWait:
  bit PPU_STATUS
  bpl VBlankWait
  rts

nmi:
  lda #1
  sta busy

  inc _framesLow
  bne @noHigh
  inc _framesHigh
  @noHigh:

  ;transfer sprites
  lda #$00
  sta PPU_SPR_ADDR
  lda #$2
  sta APU_SPR_DMA

  ;enable NMI, sprites 1, bg 0
  lda #(1<<7 | 1<<4)
  sta PPU_CTRL1

  ;enable rendering
  lda #(1<<4 | 1<<3 | 1<<2 | 1<<1)
  sta PPU_CTRL2

  ;reset VRAM addr
  lda #0
  sta PPU_VRAM_ADDR2
  sta PPU_VRAM_ADDR2

  ;Scroll
  lda _scroll_x
  sta PPU_VRAM_ADDR1
  lda _scroll_y
  sta PPU_VRAM_ADDR1

  jsr ft_music_play

  lda #0
  sta busy
  rti

.segment "VECTORS"
.word nmi
.word reset
.word 0

.segment "CHARS"
.incbin "assets/joker.chr"
