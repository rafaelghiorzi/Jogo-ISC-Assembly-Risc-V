.macro MOVE_PLAYER_MATRIZ()
	#altera a poição do personagem na matriz
		la a0,position
		lw a0,0(a0)
		li t6,2
		
		beq a0,t6,MATRIZ_ESQUERDA	
		li t6,3
		beq a0,t6,MATRIZ_DIREITA

		la a0,position
		lw a0,0(a0)
		
		
		#verifica se o personagem se moveu para esquerda ou para a direita
		li t6,0
		beq a0,t6,MATRIZ_BAIXO	
		li t6,1
		beq a0,t6,MATRIZ_CIMA
		
MATRIZ_ESQUERDA: li t6,3
		 sb t6,0(t5)		#substituição dos bytes pelo numero equivalente ao personagem em sua nova posição
		 sb zero,1(t5)		#substituição dos bytes pelo numero equivalente a espaço vazio em sua antiga posição posição
		 li t6,0
		 beq t6,zero,FIM_MAT
		 
MATRIZ_DIREITA: li t6,3
		 sb t6,0(t5)		#substituição dos bytes pelo numero equivalente ao personagem em sua nova posição
		 sb zero,-1(t5)		#substituição dos bytes pelo numero equivalente a espaço vazio em sua antiga posição posição
		 li t6,0
		 beq t6,zero,FIM_MAT
		 
MATRIZ_BAIXO: 	 li t6,3
		 sb t6,0(t5)			#substituição dos bytes pelo numero equivalente ao personagem em sua nova posição
		 li t6,0
		 sb t6,-20(t5)		#substituição dos bytes pelo numero equivalente a espaço vazio em sua antiga posição posição
		 
		 beq t6,zero,FIM_MAT
		 
MATRIZ_CIMA: 	 li t6,3
		 sb t6,0(t5)		#substituição dos bytes pelo numero equivalente ao personagem em sua nova posição
		 li t6,0
		 sb t6,20(t5)		#substituição dos bytes pelo numero equivalente a espaço vazio em sua antiga posição posição
		 
		 beq t6,zero,FIM_MAT
		
FIM_MAT:
.end_macro		  
