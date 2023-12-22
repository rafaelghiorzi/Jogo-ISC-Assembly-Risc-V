.macro MOVE_INIMIGO_MATRIZ()
	#altera a poição do personagem na matriz
		
		li t6,6
		beq a0,t6,MATRIZ_ESQUERDA_INI	
		li t6,7
		beq a0,t6,MATRIZ_DIREITA_INI

		
		
		
		#verifica se o personagem se moveu para esquerda ou para a direita
		li t6,5
		beq a0,t6,MATRIZ_BAIXO_INI	
		li t6,4
		beq a0,t6,MATRIZ_CIMA_INI
		
MATRIZ_ESQUERDA_INI: li t6,5
		 sb t6,0(t5)		#substituição dos bytes pelo numero equivalente ao personagem em sua nova posição
		 sb zero,1(t5)		#substituição dos bytes pelo numero equivalente a espaço vazio em sua antiga posição posição
		 li t6,0
		 beq t6,zero,FIM_MAT_INI
		 
MATRIZ_DIREITA_INI: li t6,5
		 sb t6,0(t5)		#substituição dos bytes pelo numero equivalente ao personagem em sua nova posição
		 sb zero,-1(t5)		#substituição dos bytes pelo numero equivalente a espaço vazio em sua antiga posição posição
		 li t6,0
		 beq t6,zero,FIM_MAT_INI
		 
MATRIZ_BAIXO_INI: 	 li t6,5
		 sb t6,0(t5)			#substituição dos bytes pelo numero equivalente ao personagem em sua nova posição
		 li t6,0
		 sb t6,-20(t5)		#substituição dos bytes pelo numero equivalente a espaço vazio em sua antiga posição posição
		 
		 beq t6,zero,FIM_MAT_INI
		 
MATRIZ_CIMA_INI: 	 li t6,5
		 sb t6,0(t5)		#substituição dos bytes pelo numero equivalente ao personagem em sua nova posição
		 li t6,0
		 sb t6,20(t5)		#substituição dos bytes pelo numero equivalente a espaço vazio em sua antiga posição posição
		 
		 beq t6,zero,FIM_MAT_INI
		
FIM_MAT_INI:
.end_macro		  
