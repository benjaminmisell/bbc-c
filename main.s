;
; File generated by cc65 v 2.17 - Git c92a3c5bd
;
	.fopt		compiler,"cc65 v 2.17 - Git c92a3c5bd"
	.setcpu		"6502"
	.smart		on
	.autoimport	on
	.case		on
	.debuginfo	off
	.importzp	sp, sreg, regsave, regbank
	.importzp	tmp1, tmp2, tmp3, tmp4, ptr1, ptr2, ptr3, ptr4
	.macpack	longbranch
	.forceimport	__STARTUP__
	.import		_printf
	.export		_reverse
	.export		_itoa
	.export		_main

.segment	"RODATA"

L002C:
	.byte	$48,$65,$6C,$6C,$6F,$2C,$20,$77,$6F,$72,$6C,$64,$21,$0A,$00

; ---------------------------------------------------------------
; void __near__ reverse (unsigned char *, int)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_reverse: near

.segment	"CODE"

	jsr     pushax
	jsr     decsp5
	ldx     #$00
	lda     #$00
	ldy     #$03
	jsr     staxysp
	ldy     #$06
	jsr     ldaxysp
	jsr     decax1
	ldy     #$01
	jsr     staxysp
L0002:	ldy     #$04
	jsr     ldaxysp
	jsr     pushax
	ldy     #$04
	jsr     ldaxysp
	jsr     tosltax
	jne     L0005
	jmp     L0003
L0005:	ldy     #$08
	jsr     ldaxysp
	jsr     pushax
	ldy     #$06
	jsr     ldaxysp
	jsr     tosaddax
	ldy     #$00
	jsr     ldauidx
	ldy     #$00
	sta     (sp),y
	ldy     #$08
	jsr     ldaxysp
	jsr     pushax
	ldy     #$06
	jsr     ldaxysp
	jsr     tosaddax
	jsr     pushax
	ldy     #$0A
	jsr     ldaxysp
	jsr     pushax
	ldy     #$06
	jsr     ldaxysp
	jsr     tosaddax
	ldy     #$00
	jsr     ldauidx
	ldy     #$00
	jsr     staspidx
	ldy     #$08
	jsr     ldaxysp
	jsr     pushax
	ldy     #$04
	jsr     ldaxysp
	jsr     tosaddax
	jsr     pushax
	ldy     #$02
	ldx     #$00
	lda     (sp),y
	ldy     #$00
	jsr     staspidx
	ldy     #$04
	jsr     ldaxysp
	sta     regsave
	stx     regsave+1
	jsr     incax1
	ldy     #$03
	jsr     staxysp
	lda     regsave
	ldx     regsave+1
	ldy     #$02
	jsr     ldaxysp
	sta     regsave
	stx     regsave+1
	jsr     decax1
	ldy     #$01
	jsr     staxysp
	lda     regsave
	ldx     regsave+1
	jmp     L0002
L0003:	ldy     #$09
	jsr     addysp
	rts

.endproc

; ---------------------------------------------------------------
; void __near__ itoa (int, unsigned char *)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_itoa: near

.segment	"CODE"

	jsr     pushax
	jsr     decsp2
	ldx     #$00
	lda     #$00
	ldy     #$00
	jsr     staxysp
L001A:	ldy     #$03
	jsr     ldaxysp
	jsr     pushax
	ldy     #$03
	jsr     ldaxysp
	sta     regsave
	stx     regsave+1
	jsr     incax1
	ldy     #$02
	jsr     staxysp
	lda     regsave
	ldx     regsave+1
	jsr     tosaddax
	jsr     pushax
	ldy     #$07
	jsr     ldaxysp
	jsr     pushax
	ldx     #$00
	lda     #$0A
	jsr     tosmodax
	ldy     #$30
	jsr     incaxy
	ldx     #$00
	ldy     #$00
	jsr     staspidx
	ldy     #$05
	jsr     ldaxysp
	jsr     pushax
	ldx     #$00
	lda     #$0A
	jsr     tosdivax
	ldy     #$04
	jsr     staxysp
	cmp     #$01
	txa
	sbc     #$00
	bvs     L0023
	eor     #$80
L0023:	asl     a
	lda     #$00
	ldx     #$00
	rol     a
	jne     L001A
	ldy     #$03
	jsr     ldaxysp
	jsr     pushax
	ldy     #$03
	jsr     ldaxysp
	jsr     tosaddax
	jsr     pushax
	ldx     #$00
	lda     #$00
	ldy     #$00
	jsr     staspidx
	ldy     #$03
	jsr     ldaxysp
	jsr     pushax
	ldy     #$03
	jsr     ldaxysp
	jsr     _reverse
	jsr     incsp6
	rts

.endproc

; ---------------------------------------------------------------
; int __near__ main (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_main: near

.segment	"CODE"

	lda     #<(L002C)
	ldx     #>(L002C)
	jsr     pushax
	ldy     #$02
	jsr     _printf
	ldx     #$00
	lda     #$1E
	jmp     L002A
L002A:	rts

.endproc
