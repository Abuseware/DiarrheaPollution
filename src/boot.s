.include "nes.inc"
.include "memory.inc"

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

.segment "ZEROPAGE"
ptr:
ptrLow: .res 1
ptrHigh: .res 1

frames:
framesLow: .res 1
framesHigh: .res 1

scroll_x: .res 1
scroll_y: .res 1

.segment "RODATA"
pallete: .incbin "assets/joker.dat"
joker: .incbin "assets/joker.nam"
sprites_rom:
  .byte $8, $0, $00, $8
.res 256 - (* - sprites_rom), $fe

.segment "DATA"

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

    inx
    bne @ClearMem

  jsr VBlankWait

  ;write pallete to 0x3f00
  LoadPallete:
    lda PPU_STATUS
    lda #$3f
    sta PPU_VRAM_ADDR2
    lda #$00
    sta PPU_VRAM_ADDR2

    ldx #0
    @LoadPalleteLoop:
      lda pallete, x
      sta PPU_VRAM_IO

      inx
      cpx #32
      bne @LoadPalleteLoop


  ;load nametable at 0x2000
  LoadNameTable:
    lda PPU_STATUS
    lda #$20
    sta PPU_VRAM_ADDR2
    lda #0
    sta PPU_VRAM_ADDR2

    lda #>joker
    sta ptrHigh
    lda #<joker
    sta ptrLow
    ldy #0
    ldx #0
    @LoadNameTableLoop:
      lda (ptr),y
      sta PPU_VRAM_IO

      iny
      cpy #0
      bne @LoadNameTableLoop
    inc ptrHigh
    inx
    cpx #4
    bne @LoadNameTableLoop

  ;load nametable at 0x2400
  LoadNameTable2:
    lda PPU_STATUS
    lda #$24
    sta PPU_VRAM_ADDR2
    lda #0
    sta PPU_VRAM_ADDR2

    lda #>joker
    sta ptrHigh
    lda #<joker
    sta ptrLow
    ldy #0
    ldx #0
    @LoadNameTableLoop2:
      lda (ptr),y
      sta PPU_VRAM_IO

      iny
      cpy #0
      bne @LoadNameTableLoop2
    inc ptrHigh
    inx
    cpx #4
    bne @LoadNameTableLoop2

  LoadSprites:
    ldx #$0
    @LoadSpritesLoop:
      lda sprites_rom, x
      sta $0200, x
      inx
      cpx #$0
      bne @LoadSpritesLoop

  jsr Setup

  ;enable NMI, sprites 1, bg 0
  lda #(1<<7 | 1<<4)
  sta PPU_CTRL1

  ;enable rendering
  lda #(1<<4 | 1<<3 | 1<<2 | 1<<1)
  sta PPU_CTRL2

  @loop:
  jsr MainLoop
  @wait:
  bit PPU_STATUS
  bpl @wait
  jmp @loop


VBlankWait:
  bit PPU_STATUS
  bpl VBlankWait
  rts

nmi:
  inc framesLow
  bne @noHigh
  inc framesHigh
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
  lda scroll_x
  sta PPU_VRAM_ADDR1
  lda scroll_y
  sta PPU_VRAM_ADDR1

  jsr VBlank

  rti

.segment "VECTORS"
.word nmi
.word reset
.word 0

.segment "SAMPLES"
.segment "CHARS"
.incbin "assets/joker.chr"
