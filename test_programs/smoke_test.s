; smoke test for the multicycle processor
;
; Final result should be:
; k0: 14   k1: 00    k2: FB    k3: 14
; and memory[30] = 14
;
	ori	5	; k1 = 5
	add	k0,k1	; k0 = 5
	add	k0,k1	; k0 = 10 (0x0A)
	shiftl	k0,1	; k0 = 20 (0x14)
	sub	k2,k1	; k2 = 0 - 5 = 0xFB
	sub	k1,k1	; k1 = 0
	ori	30	; k1 = 30
	store	k0,(k1)	; mem[30] = 0x14
	load	k3,(k1)	; k3 = mem[30] = 0x14
	sub	k1,k1	; k1 = 0, so Z = 1
done	bz	done	;
