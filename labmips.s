.data
CTRL:	.word32 0x10000
DATA:	.word32 0x10008 	; constants for printing
M:	.word32 2 		; set to 2 for integer control signal
array:	.word 1,2,3,4,5,6 	; initialize array
i:	.word 0 		; increment for array
s:	.word 48 		; size of array

.text
main:	
	ld r1,CTRL(r0)
	ld r2,DATA(r0)
	ld r6,M(r0) 		; these 3 lines setup printing
	ld r7,s(r0) 		; load upper bound to r7
	daddi r8,$0,0		; use instead of ld to prevent address being input

loop:
	;ld r10,1(r8)		; load value at index to register
	ld r9,array(r8)		; load array address to r9
	sd r9,0(r2)		; load data to data reg
	sd r6,0(r1)		; load M to control reg
	daddi r8,r8,8		; increment i
	beq r8,r7,end		; end if i = 24
	j loop			; stay in loop if i != 24

end:
	halt