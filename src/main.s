.include "nes.inc"
.include "memory.inc"

.segment "ZEROPAGE"
vector0: .res 1

.segment "STARTUP"

Setup:

  lda #8
  ldx #0
  sta SPRITE_0+SPRITE_X
  sta SPRITE_0+SPRITE_Y
  stx SPRITE_0+SPRITE_ID
  stx SPRITE_0+SPRITE_FLAGS

rts

MainLoop:
  lda #2
  bit framesHigh
  bne @ScrollRight
  inc scroll_x
  jmp @ScrollEnd
  @ScrollRight:
  dec scroll_x
  @ScrollEnd:


  ldx #0
  cpx vector0
  beq @FirstGoRight
  inx
  cpx vector0
  beq @FirstGoDown
  inx
  cpx vector0
  beq @FirstGoLeft
  inx
  cpx vector0
  beq @FirstGoUp


  ; move to right
  @FirstGoRight:
  inc SPRITE_0+SPRITE_X
  lda #$ff - 16
  cmp SPRITE_0+SPRITE_X
  bcs @FirstEnd
  inc vector0
  jmp @FirstEnd

  ; move to bottom
  @FirstGoDown:
  inc SPRITE_0+SPRITE_Y
  lda #$ef - 16
  cmp SPRITE_0+SPRITE_Y
  bcs @FirstEnd
  inc vector0
  jmp @FirstEnd

  ; move to left
  @FirstGoLeft:
  dec SPRITE_0+SPRITE_X
  lda #8
  cmp SPRITE_0+SPRITE_X
  bcc @FirstEnd
  inc vector0
  jmp @FirstEnd

  ; move to top
  @FirstGoUp:
  dec SPRITE_0+SPRITE_Y
  lda #8
  cmp SPRITE_0+SPRITE_Y
  bcc @FirstEnd
  lda #0
  sta vector0

  @FirstEnd:

  lda vector0
  sta SPRITE_0+SPRITE_FLAGS


rts
