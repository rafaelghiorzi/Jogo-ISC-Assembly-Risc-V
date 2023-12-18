

.data
.include "../sprites/fundo.data"
PONTO10: 	.string "10"


.text


INPUTSTR:	li a7,104
		la a0,PONTO10
		li a1,60
		li a2,24
		li a3,0x0038
		li a4,0
		ecall


.include "print.s"	
