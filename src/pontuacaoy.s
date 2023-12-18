PRINT_PONTOSY:	li t6, 1
		beq t6,s2, PONTOS1Y

		li t6, 2
		beq t6,s2, PONTOS2Y
		
		li t6, 3
		beq t6,s2, PONTOS3Y
		
		li t6, 4
		beq t6,s2, PONTOS4Y
		
		li t6, 5
		beq t6,s2, PONTOS5Y
		
		li t6, 6
		beq t6,s2, PONTOS6Y
		
		li t6, 7
		beq t6,s2, PONTOS7Y
		
		li t6, 8
		beq t6,s2, PONTOS8Y
		
		
	PONTOS1Y:
			la a0, milpontos
			li a1, 240
			li a2, 80	# y da pontuação
			li a3, 0
			call PRINT
			li a3, 1
			call PRINT
			j SAVEPOSY
			
	PONTOS2Y:
			la a0, doismilpontos
			li a1, 240
			li a2, 80	# y da pontuação
			li a3, 0
			call PRINT
			li a3, 1
			call PRINT
			j SAVEPOSY
			
	PONTOS3Y:
			la a0, tresmilpontos
			li a1, 240
			li a2, 80	# y da pontuação
			li a3, 0
			call PRINT
			li a3, 1
			call PRINT
			j SAVEPOSY
			
	PONTOS4Y:
			la a0, quatromilpontos
			li a1, 240
			li a2, 80	# y da pontuação
			li a3, 0
			call PRINT
			li a3, 1
			call PRINT
			j SAVEPOSY
			
	PONTOS5Y:
			la a0, cincomilpontos
			li a1, 240
			li a2, 80	# y da pontuação
			li a3, 0
			call PRINT
			li a3, 1
			call PRINT
			j SAVEPOSY
			
	PONTOS6Y:
			la a0, seismilpontos
			li a1, 240
			li a2, 80	# y da pontuação
			li a3, 0
			call PRINT
			li a3, 1
			call PRINT
			j SAVEPOSY
			
	PONTOS7Y:
			la a0, setemilpontos
			li a1, 240
			li a2, 80	# y da pontuação
			li a3, 0
			call PRINT
			li a3, 1
			call PRINT
			j SAVEPOSY
			
	PONTOS8Y:
			la a0, oitomilpontos
			li a1, 240
			li a2, 80	# y da pontuação
			li a3, 0
			call PRINT
			li a3, 1
			call PRINT
			j SAVEPOSY
			
