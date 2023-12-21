.macro PRINT_PONTOS()
		
		beq zero,s2,FIM_PONTOS
		
		li t6, 1
		beq t6,s2, PONTOS1

		li t6, 2
		beq t6,s2, PONTOS2
		
		li t6, 3
		beq t6,s2, PONTOS3
		
		li t6, 4
		beq t6,s2, PONTOS4
		
		li t6, 5
		beq t6,s2, PONTOS5
		
		li t6, 6
		beq t6,s2, PONTOS6
		
		li t6, 7
		beq t6,s2, PONTOS7
		
		li t6, 8
		beq t6,s2, PONTOS8
		
		
	PONTOS1:
			la a0, milpontos
			li a1, 240
			li a2, 80	# y da pontua??o
			li a3, 0
			call PRINT
			li a3, 1
			call PRINT
			li t6,0
			beq t6,zero,FIM_PONTOS
			
	PONTOS2:
			la a0, doismilpontos
			li a1, 240
			li a2, 80	# y da pontua??o
			li a3, 0
			call PRINT
			li a3, 1
			call PRINT
			li t6,0
			beq t6,zero,FIM_PONTOS
			
	PONTOS3:
			la a0, tresmilpontos
			li a1, 240
			li a2, 80	# y da pontua??o
			li a3, 0
			call PRINT
			li a3, 1
			call PRINT
			li t6,0
			beq t6,zero,FIM_PONTOS
			
	PONTOS4:
			la a0, quatromilpontos
			li a1, 240
			li a2, 80	# y da pontua??o
			li a3, 0
			call PRINT
			li a3, 1
			call PRINT
			li t6,0
			beq t6,zero,FIM_PONTOS
			
	PONTOS5:
			la a0, cincomilpontos
			li a1, 240
			li a2, 80	# y da pontua??o
			li a3, 0
			call PRINT
			li a3, 1
			call PRINT
			li t6,0
			beq t6,zero,FIM_PONTOS
			
	PONTOS6:
			la a0, seismilpontos
			li a1, 240
			li a2, 80	# y da pontua??o
			li a3, 0
			call PRINT
			li a3, 1
			call PRINT
			li t6,0
			beq t6,zero,FIM_PONTOS
			
	PONTOS7:
			la a0, setemilpontos
			li a1, 240
			li a2, 80	# y da pontua??o
			li a3, 0
			call PRINT
			li a3, 1
			call PRINT
			li t6,0
			beq t6,zero,FIM_PONTOS
			
	PONTOS8:
			la a0, oitomilpontos
			li a1, 240
			li a2, 80	# y da pontua??o
			li a3, 0
			call PRINT
			li a3, 1
			call PRINT
			li t6,0
			beq t6,zero,FIM_PONTOS

	FIM_PONTOS:
.end_macro