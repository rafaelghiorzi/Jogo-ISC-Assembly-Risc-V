TECLA:		li t1,0xFF200000		# carrega o endereco de controle do KDMMIO
		lw t0,0(t1)			# Le bit de Controle Teclado
		andi t0,t0,0x0001		# mascara o bit menos significativo
   		beq t0,zero,FIM   	   	# Se nao ha tecla pressionada entao vai para FIM
  		lw t2,4(t1)  			# le o valor da tecla tecla
		
		li t0,'w'
		beq t2,t0,CIMA		# se tecla pressionada for 'w', chama CIMA
		
		li t0,'a'
		beq t2,t0,ESQUERDA		# se tecla pressionada for 'a', chama CIMA
		
		li t0,'s'
		beq t2,t0,BAIXO		# se tecla pressionada for 's', chama CIMA
		
		li t0,'d'
		beq t2,t0,DIREITA		# se tecla pressionada for 'd', chama CIMA
		
		li t0,'6'			# cheat pra acelerar o processo de mostrar o jogo
		beq t2,t0,PROXIMA_FASE
		
		li t0,' '			# cheat pra acelerar o processo de mostrar o jogo
		beq t2,t0,ATAQUE
		
FIM:		ret				# retorna

ESQUERDA:		li a7,31
			li a0, 60
			li a1, 150		# som do passo
			li a2, 121
			li a3, 50
			ecall
			
		la t1, position
		li t2, 2
		sw t2, (t1)

		la t0,CHAR_POS			# carrega em t0 o endereco de CHAR_POS
		la t1,OLD_CHAR_POS		# carrega em t1 o endereco de OLD_CHAR_POS
		lw t2,0(t0)
		sw t2,0(t1)			# salva a posicao atual do personagem em OLD_CHAR_POS
		
		lh t1,0(t0)			# carrega o x atual do personagem
		addi t1,t1,-16			# decrementa 16 pixeis
		
		j COLLIDEX
		

DIREITA:		li a7,31
			li a0, 60
			li a1, 150		# som do passo
			li a2, 121
			li a3, 50
			ecall

		la t1, position
		li t2, 3
		sw t2, (t1)

		la t0,CHAR_POS			# carrega em t0 o endereco de CHAR_POS
		la t1,OLD_CHAR_POS		# carrega em t1 o endereco de OLD_CHAR_POS
		lw t2,0(t0)
		sw t2,0(t1)			# salva a posicao atual do personagem em OLD_CHAR_POS
		
		lh t1,0(t0)			# carrega o x atual do personagem
		addi t1,t1,16			# aumenta 16 pixeis

		j COLLIDEX
		

CIMA:			li a7,31
			li a0, 60
			li a1, 150		# som do passo
			li a2, 121
			li a3, 50
			ecall		

		la t1, position
		li t2, 1
		sw t2, (t1)

		la t0,CHAR_POS			# carrega em t0 o endereco de CHAR_POS
		la t1,OLD_CHAR_POS		# carrega em t1 o endereco de OLD_CHAR_POS
		lw t2,0(t0)
		sw t2,0(t1)			# salva a posicao atual do personagem em OLD_CHAR_POS
		
		lh t1,2(t0)			# carrega o y atual do personagem
		addi t1,t1,-16			# decrementa 16 pixeis
		
		j COLLIDEY
		
		
BAIXO:			li a7,31
			li a0, 60
			li a1, 150		# som do passo
			li a2, 121
			li a3, 50
			ecall
		
		la t1, position
		li t2, 0
		sw t2, (t1)

		la t0,CHAR_POS			# carrega em t0 o endereco de CHAR_POS
		la t1,OLD_CHAR_POS		# carrega em t1 o endereco de OLD_CHAR_POS
		lw t2,0(t0)
		sw t2,0(t1)			# salva a posicao atual do personagem em OLD_CHAR_POS
		
		lh t1,2(t0)			# carrega o y atual do personagem
		addi t1,t1,16			# aumenta 16 pixeis
		
		j COLLIDEY
		
ATAQUE:		la t0,position			# t0 = direcao do personagem
		lw t0, 0(t0)
		la t4,CHAR_POS
		lh a4,0(t4)			# t2 = x
		lh a5,2(t4)			# t3 = y
		li t6,16
		divu a4,a4,t6
		divu a5,a5,t6
		mv a6,s4
		add a6,a6,a4
		li t6,20
		mul a5,a5,t6
		add a6,a6,a5
		divu a5,a5,t6
		
		
		li t1,0
		beq t0,t1,ATAQUE_BAIXO
		
		li t1,1
		beq t0,t1,ATAQUE_CIMA
		
		li t1,2
		beq t0,t1,ATAQUE_ESQ
		
		li t1,3
		beq t0,t1,ATAQUE_DIREITA
		
ATAQUE_BAIXO:	lb t6,20(a6)
		li t0,4
		beq t6,t0,QUEBRA_BAIXO
		bnez t6,FIM
		li a0,4
		sb a0,20(a6)
		la a0,presente
		mv a1,a4
		li t6,16
		mul a1,a1,t6
		addi a5,a5,1
		mv a2,a5
		mul a2,a2,t6
		li a3,0
		PRINT_MACRO()
		li a3,1
		PRINT_MACRO()
		addi a6,a6,20
		li t6,0
		beq t6,zero,ATAQUE_BAIXO
		
ATAQUE_CIMA:	lb t6,-20(a6)
		li t0,4
		#beq t6,t0,QUEBRA_CIMA
		bnez t6,FIM
		li a0,4
		sb a0,-20(a6)
		la a0,presente
		mv a1,a4
		li t6,16
		mul a1,a1,t6
		addi a5,a5,-1
		mv a2,a5
		mul a2,a2,t6
		li a3,0
		PRINT_MACRO()
		li a3,1
		PRINT_MACRO()
		addi a6,a6,-20
		li t6,0
		beq t6,zero,ATAQUE_CIMA
		
ATAQUE_DIREITA:	lb t6,1(a6)
		li t0,4
		#beq t6,t0,QUEBRA_DIREITA
		bnez t6,FIM
		li a0,4
		sb a0,1(a6)
		la a0,presente
		mv a2,a5
		li t6,16
		mul a2,a2,t6
		addi a4,a4,1
		mv a1,a4
		mul a1,a1,t6
		li a3,0
		PRINT_MACRO()
		li a3,1
		PRINT_MACRO()
		addi a6,a6,1
		li t6,0
		beq t6,zero,ATAQUE_DIREITA

ATAQUE_ESQ:	lb t6,-1(a6)
		li t0,4
		#beq t6,t0,QUEBRA_ESQ
		bnez t6,FIM
		li a0,4
		sb a0,-1(a6)
		la a0,presente
		mv a2,a5
		li t6,16
		mul a2,a2,t6
		addi a4,a4,-1
		mv a1,a4
		mul a1,a1,t6
		li a3,0
		PRINT_MACRO()
		li a3,1
		PRINT_MACRO()
		addi a6,a6,-1
		li t6,0
		beq t6,zero,ATAQUE_ESQ
		
QUEBRA_BAIXO:	lb t6,20(a6)
		li t0,4
		bne t6,t0,FIM
		li a0,0
		sb a0,20(a6)
		la a0,fundo_quadrado
		mv a1,a4
		li t6,16
		mul a1,a1,t6
		addi a5,a5,1
		mv a2,a5
		mul a2,a2,t6
		li a3,0
		PRINT_MACRO()
		li a3,1
		PRINT_MACRO()
		addi a6,a6,20
		li t6,0
		beq t6,zero,QUEBRA_BAIXO
		
#QUEBRA_CIMA:	lb t6,-20(a6)
#		li t0,4
#		bne t6,t0,FIM
#		li a0,0
#		sb a0,-20(a6)
#		la a0,fundo_quadrado
#		mv a1,a4
#		li t6,16
#		mul a1,a1,t6
#		addi a5,a5,-1
#		mv a2,a5
#		mul a2,a2,t6
#		li a3,0
#		PRINT_MACRO()
#		li a3,1
#		PRINT_MACRO()
#		addi a6,a6,-20
#		li t6,0
#		beq t6,zero,QUEBRA_CIMA
		
#QUEBRA_DIREITA:	lb t6,1(a6)
#		li t0,4
#		bne t6,t0,FIM
#		li a0,0
#		sb a0,1(a6)
#		la a0,fundo_quadrado
#		mv a2,a5
#		li t6,16
#		mul a2,a2,t6
#		addi a4,a4,1
#		mv a1,a4
#		mul a1,a1,t6
#		li a3,0
#		PRINT_MACRO()
#		li a3,1
#		PRINT_MACRO()
#		addi a6,a6,1
#		li t6,0
#		beq t6,zero,QUEBRA_DIREITA
		
#QUEBRA_ESQ:	lb t6,-1(a6)
#		li t0,4
#		bne t6,t0,FIM
#		li a0,0
#		sb a0,-1(a6)
#		la a0,fundo_quadrado
#		mv a2,a5
#		li t6,16
#		mul a2,a2,t6
#		addi a4,a4,-1
#		mv a1,a4
#		mul a1,a1,t6
#		li a3,0
#		PRINT_MACRO()
#		li a3,1
#		PRINT_MACRO()
#		addi a6,a6,-1
#		li t6,0
#		beq t6,zero,QUEBRA_ESQ
		
COLLIDEX: 	
		mv t5, s4			# endereço do primeiro byte do mapa
		li t3, 16			# t3 = 16	
		divu t3, t1, t3			# t3 = x/16 endereço real x no mapa
		add t5, t5, t3			# endereço mapa + posição x
		li t3, 16
		lh t4, 2(t0)			# t4 = y do personagem
		divu t4, t4, t3			# t4 = y/16 endereço real y no mapa
		li t3, 20			# t3 = 20
		mul t4, t4, t3			# t4 = t4 * 20
		add t5, t5, t4			# endereço do mapa + posição y real
		lbu t4, (t5)			# t4 = byte da posição do personagem
		
		# testar as opçoes
		li t6,0
		beq t4,t6, SAVEPOSX		# se o byte não for 0 não pode andar, sai        se o byte for 0, pode andar
		
		li t6,1
		beq t4, t6, FIM			# se o byte for igual a 1 não pode andar, sai sem salvar a half
		
		li t6,2
		beq t4, t6, COLETAVEISX		# se o byte for igual a 2 é um coletavel, pega, aumenta a pontuação e anda
		
		li t6, 5			# se o byte for igual a 5 é um inimigo, perde o jogo
		beq t4,t6, DERROTA
		
		
		j FIM
		
SAVEPOSX:	sh t1,0(t0)			# salva
    		#mv s6, t1       # salva a posição X em s6		
		#beq s6, s8, CHECAY
		MOVE_PLAYER_MATRIZ()
		ret
		
COLLIDEY:
		mv t5, s4			# endereço do primeiro byte do mapa
		li t3, 16			# t3 = 16
		divu t4, t1, t3			# t4 = y/16
		li t3, 20			# t3 = 20	
		mul t4, t4, t3			# t4 = t4 * 20 y no mapa level
		add t5, t5, t4			# endereço do primeiro byte do mapa + y 
		li t3, 16			# t3 = 16
		lh t4, 0(t0)			# t4 = x (char_pos)	
		divu t4, t4, t3			# t4 = x/16
		add t5, t5, t4			# endereço do mapa + x	
		lbu t4, (t5)			# t4 = byte da posição do personagem
		
		# testar as opçoes
		li t6,0
		beq t4,t6, SAVEPOSY		# se o byte não for 0 não pode andar, sai        se o byte for 0, pode andar
		
		li t6,1
		beq t4, t6, FIM			# se o byte for igual a 1 não pode andar, sai sem salvar a half
		
		li t6,2
		beq t4, t6, COLETAVEISY		# se o byte for igual a 2 é um coletavel, pega, aumenta a pontuação e anda
		
		li t6, 5			# se o byte for igual a 5 é um inimigo, perde o jogo
		beq t4,t6, DERROTA
		
		j FIM
		
SAVEPOSY:	sh t1,2(t0)			# salva
    		#mv s7, t1       # salva a posição Y em s7
		#beq s6, s8, CHECAY
		MOVE_PLAYER_MATRIZ()
		ret
		
COLETAVEISX: #s2 ? a quantidade de coletaveis, logo a pontua??o
			li a7,31
			li a0, 60
			li a1, 150		# som de pegar coletavel
			li a2, 99
			li a3, 50
			ecall
	addi s2,s2, 1
	#sb zero,0(t5)
	beq s2,s3, PROXIMA_FASE		# condição de vitória do jogador, passa pra proxima fase ou finaliza o jogo
	j SAVEPOSX
	
COLETAVEISY: #s2 ? a quantidade de coletaveis, logo a pontua??o
			li a7,31
			li a0, 60
			li a1, 150		# som de pegar coletavel
			li a2, 99
			li a3, 50
			ecall
	addi s2,s2, 1
	#sb zero,0(t5)
	beq s2,s3, PROXIMA_FASE
	j SAVEPOSY
	
PROXIMA_FASE:	li a7 32
		li a0, 300	# espera um pouco antes de pular pra próxima fase ou para a vitoria
		ecall
		
		li s2, 0
		
		li t6, 0
		beq s5, t6, SETUP_NIVEL2
		
		li t6, 1
		beq s5,t6, VITORIA
		
