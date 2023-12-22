INIMIGO:
	#####################################
	# Lógica de movimento aleatório     #
	#####################################
	li a7, 42               # Syscall 42 - RandIntRange
	li a0, 0                # Índice do gerador de números pseudoaleatórios
	li a1, 5              # Limite superior para a direção aleatória (0 a 100)
	ecall
	mv t6, a0               # Armazena o resultado em t6 (direção aleatória)

	# Movimenta o inimigo de acordo com a direção
	la t1, INI_POS
	lh t2, 0(t1)            # Carrega x do inimigo
	lh t3, 2(t1)            # Carrega y do inimigo

	# Atualiza a posição do inimigo de acordo com a direção
	li t4, 0
	beq t6, t4, INI_CIMA
	
	li t4, 1
	beq t6, t4, INI_BAIXO
	
	li t4, 2
	beq t6, t4, INI_ESQUERDA
	
	li t4, 3
	beq t6, t4, INI_DIREITA
	
	ret
	

INI_ESQUERDA:		li a7,31
			li a0, 60
			li a1, 150		# som do passo
			li a2, 121
			li a3, 50
			ecall
		li a0, 6	
		la t0,INI_POS			# carrega em t0 o endereco de INI_POS
		la t1,OLD_INI_POS		# carrega em t1 o endereco de OLD_INI_POS
		lw t2,0(t0)
		sw t2,0(t1)			# salva a posicao atual do personagem em OLD_INI_POS
		
		lh t1,0(t0)			# carrega o x atual do personagem
		addi t1,t1,-16			# decrementa 16 pixeis
		
		j INI_COLLIDEX
		

INI_DIREITA:		li a7,31
			li a0, 60
			li a1, 150		# som do passo
			li a2, 121
			li a3, 50
			ecall
		li a0, 7
		la t0,INI_POS			# carrega em t0 o endereco de INI_POS
		la t1,OLD_INI_POS		# carrega em t1 o endereco de OLD_INI_POS
		lw t2,0(t0)
		sw t2,0(t1)			# salva a posicao atual do personagem em OLD_INI_POS
		
		lh t1,0(t0)			# carrega o x atual do personagem
		addi t1,t1,16			# aumenta 16 pixeis

		j INI_COLLIDEX
		

INI_CIMA:			li a7,31
			li a0, 60
			li a1, 150		# som do passo
			li a2, 121
			li a3, 50
			ecall	
				
		li a0,4
		la t0,INI_POS			# carrega em t0 o endereco de INI_POS
		la t1,OLD_INI_POS		# carrega em t1 o endereco de OLD_INI_POS
		lw t2,0(t0)
		sw t2,0(t1)			# salva a posicao atual do personagem em OLD_INI_POS
		
		lh t1,2(t0)			# carrega o y atual do personagem
		addi t1,t1,-16			# decrementa 16 pixeis
		
		j INI_COLLIDEY
		
		
INI_BAIXO:			li a7,31
			li a0, 60
			li a1, 150		# som do passo
			li a2, 121
			li a3, 50
			ecall
			
		li a0,5
		la t0,INI_POS			# carrega em t0 o endereco de INI_POS
		la t1,OLD_INI_POS		# carrega em t1 o endereco de OLD_INI_POS
		lw t2,0(t0)
		sw t2,0(t1)			# salva a posicao atual do personagem em OLD_INI_POS
		
		lh t1,2(t0)			# carrega o y atual do personagem
		addi t1,t1,16			# aumenta 16 pixeis
		
		j INI_COLLIDEY
		
INI_COLLIDEX: 	
		mv t5, s4			# endere o do primeiro byte do mapa
		li t3, 16			# t3 = 16	
		divu t3, t1, t3			# t3 = x/16 endere o real x no mapa
		add t5, t5, t3			# endere o mapa + posi  o x
		li t3, 16
		lh t4, 2(t0)			# t4 = y do personagem
		divu t4, t4, t3			# t4 = y/16 endere o real y no mapa
		li t3, 20			# t3 = 20
		mul t4, t4, t3			# t4 = t4 * 20
		add t5, t5, t4			# endere o do mapa + posi  o y real
		lbu t4, (t5)			# t4 = byte da posi  o do personagem
		
		li t6,3
		beq t4,t6,DERROTA	
		bnez t4, FIM			# se o byte não for 0 não pode andar, sai
		
		sh t1,0(t0)			# salva
		MOVE_INIMIGO_MATRIZ()
		ret
		#mv s8, t1       # salva a posição X em s8 do inimigo
		#j INIMIGO_JOGADOR
		
INI_COLLIDEY:
		mv t5, s4			# endere o do primeiro byte do mapa
		li t3, 16			# t3 = 16
		divu t4, t1, t3			# t4 = y/16
		li t3, 20			# t3 = 20	
		mul t4, t4, t3			# t4 = t4 * 20 y no mapa level
		add t5, t5, t4			# endere o do primeiro byte do mapa + y 
		li t3, 16			# t3 = 16
		lh t4, 0(t0)			# t4 = x (char_pos)	
		divu t4, t4, t3			# t4 = x/16
		add t5, t5, t4			# endere o do mapa + x	
		lbu t4, (t5)			# t4 = byte da posi  o do personagem
		
		li t6,3
		beq t4,t6,DERROTA
		bnez t4, FIM			# se o byte não for 0 não pode andar, sai
		MOVE_INIMIGO_MATRIZ()
		sh t1,2(t0)			# salva
		ret
		#mv s9, t1       # salva a posição Y em s9 do inimigo
		#j INIMIGO_JOGADOR
		
#INIMIGO_JOGADOR:
		#beq s6, s8, CHECAY

		#ret
		
		#CHECAX:	beq s6,s8, DERROTA		
		#CHECAY:	beq s7,s9, DERROTA

# s6 = x jogador, s7 = y jogador
# s8 = x inimigo, s9 = y inimigo
