; FamiTracker exported music data: Duck_Tales_Moon
;

; Module header
	.word ft_song_list
	.word ft_instrument_list
	.word ft_sample_list
	.word ft_samples
	.byte 2 ; flags
	.word 3600 ; NTSC speed
	.word 3000 ; PAL speed

; Instrument pointer list
ft_instrument_list:
	.word ft_inst_0
	.word ft_inst_1
	.word ft_inst_2
	.word ft_inst_3
	.word ft_inst_4
	.word ft_inst_5
	.word ft_inst_6
	.word ft_inst_7
	.word ft_inst_8
	.word ft_inst_9
	.word ft_inst_10
	.word ft_inst_11

; Instruments
ft_inst_0:
	.byte 17
	.word ft_seq_2a03_0
	.word ft_seq_2a03_9

ft_inst_1:
	.byte 1
	.word ft_seq_2a03_5

ft_inst_2:
	.byte 1
	.word ft_seq_2a03_10

ft_inst_3:
	.byte 17
	.word ft_seq_2a03_15
	.word ft_seq_2a03_14

ft_inst_4:
	.byte 17
	.word ft_seq_2a03_20
	.word ft_seq_2a03_4

ft_inst_5:
	.byte 17
	.word ft_seq_2a03_25
	.word ft_seq_2a03_4

ft_inst_6:
	.byte 17
	.word ft_seq_2a03_30
	.word ft_seq_2a03_4

ft_inst_7:
	.byte 17
	.word ft_seq_2a03_35
	.word ft_seq_2a03_4

ft_inst_8:
	.byte 19
	.word ft_seq_2a03_20
	.word ft_seq_2a03_1
	.word ft_seq_2a03_9

ft_inst_9:
	.byte 17
	.word ft_seq_2a03_40
	.word ft_seq_2a03_19

ft_inst_10:
	.byte 17
	.word ft_seq_2a03_30
	.word ft_seq_2a03_19

ft_inst_11:
	.byte 1
	.word ft_seq_2a03_45

; Sequences
ft_seq_2a03_0:
	.byte $0A, $FF, $00, $00, $07, $07, $07, $07, $07, $05, $05, $01, $01, $00
ft_seq_2a03_1:
	.byte $04, $00, $00, $00, $00, $00, $01, $01
ft_seq_2a03_4:
	.byte $01, $FF, $00, $00, $00
ft_seq_2a03_5:
	.byte $0A, $FF, $00, $00, $0A, $0A, $0A, $06, $06, $06, $04, $04, $02, $00
ft_seq_2a03_9:
	.byte $01, $FF, $00, $00, $03
ft_seq_2a03_10:
	.byte $01, $FF, $00, $00, $0F
ft_seq_2a03_14:
	.byte $01, $FF, $00, $00, $03
ft_seq_2a03_15:
	.byte $10, $FF, $00, $00, $03, $04, $06, $07, $08, $09, $0A, $0A, $0A, $0B, $0C, $0C, $0D, $0F, $0F, $0F
ft_seq_2a03_19:
	.byte $01, $FF, $00, $00, $01
ft_seq_2a03_20:
	.byte $01, $FF, $00, $00, $0F
ft_seq_2a03_25:
	.byte $1E, $FF, $00, $00, $03, $04, $04, $04, $04, $05, $05, $05, $05, $05, $06, $06, $07, $07, $08, $08
	.byte $08, $09, $09, $09, $0A, $0A, $0A, $0A, $0B, $0B, $0C, $0D, $0D, $0E
ft_seq_2a03_30:
	.byte $0A, $FF, $00, $00, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $00
ft_seq_2a03_35:
	.byte $12, $FF, $00, $00, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F
	.byte $0F, $00
ft_seq_2a03_40:
	.byte $09, $FF, $00, $00, $07, $07, $07, $07, $07, $07, $07, $01, $00
ft_seq_2a03_45:
	.byte $05, $FF, $00, $00, $06, $06, $06, $06, $00

; DPCM instrument list (pitch, sample index)
ft_sample_list:

; DPCM samples list (location, size, bank)
ft_samples:


; Song pointer list
ft_song_list:
	.word ft_song_0

; Song info
ft_song_0:
	.word ft_s0_frames
	.byte 19	; frame count
	.byte 32	; pattern length
	.byte 5	; speed
	.byte 150	; tempo
	.byte 0	; initial bank


;
; Pattern and frame data for all songs below
;

; Bank 0
ft_s0_frames:
	.word ft_s0f0
	.word ft_s0f1
	.word ft_s0f2
	.word ft_s0f3
	.word ft_s0f4
	.word ft_s0f5
	.word ft_s0f6
	.word ft_s0f7
	.word ft_s0f8
	.word ft_s0f9
	.word ft_s0f10
	.word ft_s0f11
	.word ft_s0f12
	.word ft_s0f13
	.word ft_s0f14
	.word ft_s0f15
	.word ft_s0f16
	.word ft_s0f17
	.word ft_s0f18
ft_s0f0:
	.word ft_s0p0c0, ft_s0p0c1, ft_s0p0c2, ft_s0p0c2, ft_s0p0c2
ft_s0f1:
	.word ft_s0p1c0, ft_s0p0c1, ft_s0p1c2, ft_s0p0c2, ft_s0p0c2
ft_s0f2:
	.word ft_s0p2c0, ft_s0p0c1, ft_s0p2c2, ft_s0p0c2, ft_s0p0c2
ft_s0f3:
	.word ft_s0p3c0, ft_s0p0c1, ft_s0p3c2, ft_s0p0c2, ft_s0p0c2
ft_s0f4:
	.word ft_s0p4c0, ft_s0p7c1, ft_s0p4c2, ft_s0p1c3, ft_s0p0c2
ft_s0f5:
	.word ft_s0p5c0, ft_s0p1c1, ft_s0p5c2, ft_s0p2c3, ft_s0p0c2
ft_s0f6:
	.word ft_s0p6c0, ft_s0p1c1, ft_s0p6c2, ft_s0p2c3, ft_s0p0c2
ft_s0f7:
	.word ft_s0p7c0, ft_s0p1c1, ft_s0p7c2, ft_s0p2c3, ft_s0p0c2
ft_s0f8:
	.word ft_s0p8c0, ft_s0p1c1, ft_s0p8c2, ft_s0p2c3, ft_s0p0c2
ft_s0f9:
	.word ft_s0p9c0, ft_s0p1c1, ft_s0p9c2, ft_s0p2c3, ft_s0p0c2
ft_s0f10:
	.word ft_s0p10c0, ft_s0p1c1, ft_s0p10c2, ft_s0p2c3, ft_s0p0c2
ft_s0f11:
	.word ft_s0p11c0, ft_s0p1c1, ft_s0p11c2, ft_s0p2c3, ft_s0p0c2
ft_s0f12:
	.word ft_s0p12c0, ft_s0p1c1, ft_s0p12c2, ft_s0p2c3, ft_s0p0c2
ft_s0f13:
	.word ft_s0p13c0, ft_s0p2c1, ft_s0p13c2, ft_s0p2c3, ft_s0p0c2
ft_s0f14:
	.word ft_s0p14c0, ft_s0p3c1, ft_s0p14c2, ft_s0p2c3, ft_s0p0c2
ft_s0f15:
	.word ft_s0p15c0, ft_s0p4c1, ft_s0p15c2, ft_s0p2c3, ft_s0p0c2
ft_s0f16:
	.word ft_s0p16c0, ft_s0p5c1, ft_s0p14c2, ft_s0p2c3, ft_s0p0c2
ft_s0f17:
	.word ft_s0p17c0, ft_s0p6c1, ft_s0p15c2, ft_s0p2c3, ft_s0p0c2
ft_s0f18:
	.word ft_s0p18c0, ft_s0p1c1, ft_s0p16c2, ft_s0p2c3, ft_s0p0c2
; Bank 0
ft_s0p0c0:
	.byte $FA, $00, $1F

; Bank 0
ft_s0p0c1:
	.byte $82, $01, $E9, $FF, $37, $3E, $43, $45, $3E, $43, $45, $48, $3E, $48, $47, $3E, $47, $45, $84, $43
	.byte $00, $8C, $01, $00, $02

; Bank 0
ft_s0p0c2:
	.byte $00, $1F

; Bank 0
ft_s0p1c0:
	.byte $E3, $FA, $32, $06, $9C, $58, $00, $0A, $9C, $00, $37, $03, $39, $03, $3C, $05

; Bank 0
ft_s0p1c1:
	.byte $82, $01, $E0, $FF, $37, $3E, $43, $45, $3E, $43, $45, $3E, $48, $3E, $48, $47, $3E, $47, $45, $84
	.byte $43, $01

; Bank 0
ft_s0p1c2:
	.byte $E2, $2B, $05, $32, $05, $37, $10, $7F, $02

; Bank 0
ft_s0p1c3:
	.byte $00, $15, $E1, $16, $01, $11, $01, $16, $01, $11, $03

; Bank 0
ft_s0p2c0:
	.byte $E3, $FA, $3C, $05, $3B, $01, $3B, $04, $9C, $58, $00, $08, $9C, $00, $39, $03, $37, $05

; Bank 0
ft_s0p2c1:
	.byte $82, $01, $E0, $FF, $43, $3A, $3F, $45, $3C, $45, $48, $47, $43, $3E, $3C, $3B, $37, $32, $30, $84
	.byte $2F, $01

; Bank 0
ft_s0p2c2:
	.byte $E2, $29, $05, $30, $05, $35, $10, $7F, $02

; Bank 0
ft_s0p2c3:
	.byte $82, $01, $E1, $11, $EB, $1D, $E1, $16, $EB, $1D, $E1, $11, $EB, $1D, $E1, $16, $EB, $1D, $E1, $11
	.byte $EB, $1D, $E1, $16, $EB, $1D, $E1, $11, $EB, $1D, $E1, $16, $84, $16, $01

; Bank 0
ft_s0p3c0:
	.byte $E3, $9C, $00, $FA, $3E, $0B, $37, $0B, $43, $07

; Bank 0
ft_s0p3c1:
	.byte $E6, $F7, $2E, $01, $2E, $05, $30, $01, $30, $03, $E4, $2E, $03, $EA, $39, $01, $3A, $01, $41, $03
	.byte $45, $01, $46, $01, $4D, $01

; Bank 0
ft_s0p3c2:
	.byte $E2, $28, $05, $2F, $05, $34, $10, $7F, $02

; Bank 0
ft_s0p4c0:
	.byte $FA, $00, $06, $9C, $48, $00, $10, $E3, $9C, $00, $45, $03, $43, $01, $9C, $00, $45, $01

; Bank 0
ft_s0p4c1:
	.byte $E4, $F7, $27, $01, $E6, $00, $01, $27, $01, $27, $03, $27, $03, $E4, $2A, $0F, $7F, $01

; Bank 0
ft_s0p4c2:
	.byte $E2, $27, $05, $2E, $05, $33, $10, $7F, $02

; Bank 0
ft_s0p5c0:
	.byte $E3, $FA, $4A, $0D, $9C, $28, $00, $11

; Bank 0
ft_s0p5c1:
	.byte $E6, $F7, $33, $01, $33, $05, $30, $01, $82, $03, $30, $E7, $32, $32, $32, $84, $E6, $32, $01, $35
	.byte $01, $E4, $37, $01

; Bank 0
ft_s0p5c2:
	.byte $E2, $37, $1F

; Bank 0
ft_s0p6c0:
	.byte $9C, $00, $FA, $7F, $07, $E4, $2F, $01, $30, $01, $E6, $32, $01, $E4, $32, $05, $37, $03, $36, $03
	.byte $37, $03

; Bank 0
ft_s0p6c1:
	.byte $F7, $00, $0B, $E6, $37, $01, $E4, $36, $0A, $7F, $00, $E6, $36, $01, $36, $01, $E4, $37, $01

; Bank 0
ft_s0p6c2:
	.byte $82, $01, $E6, $37, $37, $37, $37, $37, $37, $37, $37, $36, $36, $36, $36, $36, $36, $36, $84, $36
	.byte $01

; Bank 0
ft_s0p7c0:
	.byte $E4, $FA, $39, $03, $3B, $01, $37, $09, $9C, $58, $00, $0A, $9C, $00, $00, $00, $36, $01, $37, $01

; Bank 0
ft_s0p7c1:
	.byte $82, $01, $E0, $FF, $37, $3E, $43, $45, $3E, $43, $45, $48, $3E, $48, $47, $3E, $47, $45, $84, $43
	.byte $00, $8C, $01, $00, $02

; Bank 0
ft_s0p7c2:
	.byte $82, $01, $E6, $34, $34, $34, $34, $34, $34, $34, $34, $32, $32, $32, $32, $32, $32, $32, $84, $32
	.byte $01

; Bank 0
ft_s0p8c0:
	.byte $E4, $FA, $3E, $05, $E6, $37, $01, $E4, $37, $07, $9C, $58, $00, $0A, $9C, $00, $00, $00, $E6, $37
	.byte $01, $37, $01

; Bank 0
ft_s0p8c2:
	.byte $82, $01, $E6, $30, $30, $30, $30, $30, $30, $30, $30, $31, $31, $31, $31, $31, $31, $31, $84, $31
	.byte $01

; Bank 0
ft_s0p9c0:
	.byte $E4, $FA, $37, $07, $7F, $01, $39, $01, $37, $01, $36, $07, $9C, $58, $00, $08, $9C, $00, $7F, $00

; Bank 0
ft_s0p9c2:
	.byte $82, $01, $E6, $32, $32, $32, $32, $32, $32, $32, $32, $32, $32, $32, $32, $32, $32, $32, $84, $32
	.byte $01

; Bank 0
ft_s0p10c0:
	.byte $E4, $FA, $2F, $07, $7F, $01, $2D, $01, $2B, $01, $32, $07, $7F, $01, $37, $03, $39, $03

; Bank 0
ft_s0p10c2:
	.byte $82, $01, $E6, $37, $37, $37, $37, $37, $37, $37, $37, $35, $35, $35, $35, $35, $35, $35, $84, $35
	.byte $01

; Bank 0
ft_s0p11c0:
	.byte $E4, $FA, $3C, $05, $E6, $3B, $01, $E4, $3B, $07, $9C, $58, $00, $07, $9C, $00, $3E, $03, $3C, $03

; Bank 0
ft_s0p11c2:
	.byte $82, $01, $E6, $34, $34, $34, $34, $34, $34, $34, $34, $33, $33, $33, $33, $33, $33, $33, $84, $33
	.byte $01

; Bank 0
ft_s0p12c0:
	.byte $E4, $FA, $3B, $01, $3C, $01, $3B, $01, $37, $03, $32, $07, $82, $01, $39, $37, $36, $34, $84, $36
	.byte $05

; Bank 0
ft_s0p12c2:
	.byte $82, $01, $E6, $32, $32, $32, $32, $32, $32, $32, $32, $31, $31, $31, $31, $32, $32, $32, $84, $32
	.byte $01

; Bank 0
ft_s0p13c0:
	.byte $E4, $FA, $37, $01, $7F, $03, $37, $01, $7F, $03, $37, $03, $7F, $01, $E5, $94, $05, $20, $0C, $92
	.byte $00, $00

; Bank 0
ft_s0p13c2:
	.byte $E6, $33, $05, $35, $05, $E2, $37, $05, $82, $01, $E6, $2B, $2B, $2B, $2B, $2B, $2B, $84, $2B, $01

; Bank 0
ft_s0p14c0:
	.byte $E6, $FA, $37, $01, $37, $05, $39, $01, $39, $03, $E4, $35, $07, $32, $03, $E6, $35, $01, $E8, $30
	.byte $01, $E6, $2E, $01

; Bank 0
ft_s0p14c2:
	.byte $E6, $30, $01, $30, $05, $35, $01, $35, $03, $82, $01, $E2, $2E, $E6, $00, $2E, $2E, $2E, $2E, $2E
	.byte $2E, $84, $2E, $01

; Bank 0
ft_s0p15c0:
	.byte $E4, $FA, $30, $03, $E6, $2E, $01, $30, $03, $2E, $03, $E4, $32, $0F, $7F, $01

; Bank 0
ft_s0p15c2:
	.byte $82, $01, $E6, $30, $30, $30, $30, $30, $30, $30, $30, $32, $32, $32, $32, $32, $32, $32, $84, $32
	.byte $01

; Bank 0
ft_s0p16c0:
	.byte $E6, $FA, $37, $01, $37, $05, $39, $01, $82, $03, $39, $E4, $3A, $E7, $35, $35, $84, $E6, $35, $01
	.byte $3A, $01, $E4, $3C, $01

; Bank 0
ft_s0p16c2:
	.byte $82, $01, $E6, $33, $33, $33, $33, $33, $33, $33, $33, $84, $33, $07, $E2, $33, $03, $35, $02, $8A
	.byte $07, $00, $00

; Bank 0
ft_s0p17c0:
	.byte $FA, $00, $0B, $E6, $3A, $01, $E4, $3E, $0A, $7F, $00, $E6, $3E, $01, $3E, $01, $E4, $3E, $01

; Bank 0
ft_s0p18c0:
	.byte $FA, $00, $07, $9C, $58, $00, $0E, $9C, $00, $7F, $00, $E4, $1B, $03, $1D, $03


; DPCM samples (located at DPCM segment)
