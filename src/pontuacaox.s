PRINT_PONTOSX:	li t6, 1
		beq t6,s2, PONTOS1X

		li t6, 2
		beq t6,s2, PONTOS2X
		
		li t6, 3
		beq t6,s2, PONTOS3X
		
		li t6, 4
		beq t6,s2, PONTOS4X
		
		li t6, 5
		beq t6,s2, PONTOS5X
		
		li t6, 6
		beq t6,s2, PONTOS6X
		
		li t6, 7
		beq t6,s2, PONTOS7X
		
		li t6, 8
		beq t6,s2, PONTOS8X
		
		
	PONTOS1X:
			la a0, milpontos
			li a1, 240
			li a2, 80	# y da pontuação
			li a3, 0
			call PRINT
			li a3, 1
			call PRINT
			j SAVEPOSX
			
	PONTOS2X:
			la a0, doismilpontos
			li a1, 240
			li a2, 80	# y da pontuação
			li a3, 0
			call PRINT
			li a3, 1
			call PRINT
			j SAVEPOSX
			
	PONTOS3X:
			la a0, tresmilpontos
			li a1, 240
			li a2, 80	# y da pontuação
			li a3, 0
			call PRINT
			li a3, 1
			call PRINT
			j SAVEPOSX
			
	PONTOS4X:
			la a0, quatromilpontos
			li a1, 240
			li a2, 80	# y da pontuação
			li a3, 0
			call PRINT
			li a3, 1
			call PRINT
			j SAVEPOSX
			
	PONTOS5X:
			la a0, cincomilpontos
			li a1, 240
			li a2, 80	# y da pontuação
			li a3, 0
			call PRINT
			li a3, 1
			call PRINT
			j SAVEPOSX
			
	PONTOS6X:
			la a0, seismilpontos
			li a1, 240
			li a2, 80	# y da pontuação
			li a3, 0
			call PRINT
			li a3, 1
			call PRINT
			j SAVEPOSX
			
	PONTOS7X:
			la a0, setemilpontos
			li a1, 240
			li a2, 80	# y da pontuação
			li a3, 0
			call PRINT
			li a3, 1
			call PRINT
			j SAVEPOSX
			
	PONTOS8X:
			la a0, oitomilpontos
			li a1, 240
			li a2, 80	# y da pontuação
			li a3, 0
			call PRINT
			li a3, 1
			call PRINT
			j SAVEPOSX
			