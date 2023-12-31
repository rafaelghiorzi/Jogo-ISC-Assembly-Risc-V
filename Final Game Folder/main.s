.include "MACROSv21.s"

.data
.include "src/moveplayermatriz.s"
.include "src/moveinimigomatriz.s"
.include "src/print_macro.s"
.include "src/print_pontos.s"
####### JOGADOR ############
CHAR_POS:	.half 96,96			# x, y
OLD_CHAR_POS:	.half 96,96			# x, y
###########################

###### INIMIGO ############
INI_POS:	.half 80,64
OLD_INI_POS:	.half 80,64
###########################

########### INFORMAÇÕES###########
# s2 e s3 = contador de coletaveis e meta de coletaveis, respectivamente
# s4 = mapa do nivel n-ésimo
# s5 = nivel atual
# S6, S8 = X do jogador e do inimigo
# S7, S9 = Y do jogador e do inimigo
# S11 = contador de iterações
###################################

position: .word 0 # 0 = playerdown, 1 = playerup, 2=playerleft, 3=playerright
player_position: .word playerdown, playerup, playerleft, playerright
.text
SETUP_NIVEL1:	li s3, 8			# total de coletaveis em todos os niveis
		li s2, 0			# reinicia os coletaveis
		la s4, nivel1			# carrega as informaÃ§Ãµes do nivel 1
		li s5, 0			# nivel 0 (no caso nivel 1)
		li s6, 96
		li s7, 96
		li s8, 80
		li s9, 64
		li s11, 0
		
		
		la a0,fundo			# carrega o endereco do sprite 'fundo' em a0
		li a1,0				# x = 0
		li a2,0				# y = 0
		li a3,0				# frame = 0
		call PRINT			# imprime o sprite
		li a3,1				# frame = 1
		call PRINT			# imprime o sprite
		la a0, mapa1
		li a3, 0
		call PRINT			# imprime as informaÃ§Ãµes do primeiro nÃ­vel
		li a3,1
		call PRINT
		la a0, zeropontos
		li a1, 240
		li a2, 80			# imprime a pontuacao zerada
		li a3, 0
		call PRINT
		li a3, 1
		call PRINT

		# esse setup serve pra desenhar o "fundo" nos dois frames antes do "jogo" comecar
		
		j GAME_LOOP

SETUP_NIVEL2:	li s2, 0	# reinicia a contagem de coletaveis
		la s4, nivel2
		li s5,1		# nivel 1 (no caso nivel 2)

		li s6, 96
		li s7, 96
		li s8, 80
		li s9, 64
		li s11, 0
		
		la a0,fundo			# carrega o endereco do sprite 'fundo' em a0
		li a1,0				# x = 0
		li a2,0				# y = 0
		li a3,0				# frame = 0
		call PRINT			# imprime o sprite
		li a3,1				# frame = 1
		call PRINT			# imprime o sprite
		la a0, mapa2
		li a3, 0
		call PRINT			# imprime as informaÃ§Ãµes do primeiro nÃ­vel
		li a3,1
		call PRINT
		la a0, zeropontos
		li a1, 240
		li a2, 80			# imprime a pontuacao zerada
		li a3, 0
		call PRINT
		li a3, 1
		call PRINT
		
		
		li t6, 96              # Carrega o valor 96 para t6
		# Modifica o valor em CHAR_POS
		la t0, CHAR_POS        # Carrega o endereÃ§o de CHAR_POS em t0
		sh t6, 0(t0)           # Armazena o valor 96 no primeiro half-word de CHAR_POS
		sh t6, 2(t0)           # Armazena o valor 96 no segundo half-word de CHAR_POS
		
		# Modifica o valor em OLD_CHAR_POS
		la t0, OLD_CHAR_POS    # Carrega o endereÃ§o de OLD_CHAR_POS em t0
		sh t6, 0(t0)           # Armazena o valor 96 no primeiro half-word de OLD_CHAR_POS
		sh t6, 2(t0)           # Armazena o valor 96 no segundo half-word de OLD_CHAR_POS
		
		
		j GAME_LOOP
		
GAME_LOOP:	call TECLA			# chama o procedimento de entrada do teclado
		
    # Aumenta a contagem de iterações
    addi s11,s11,1

    # Verifica se atingiu 300 iterações
    li t6, 150
    bne s11, t6, PULA
    
    # Se for igual, reseta s11 e chama o inimigo
    li s11, 0
    call INIMIGO

PULA:
		PRINT_PONTOS()

		xori s0,s0,1			# inverte o valor frame atual (somente o registrador)
		
		la t0,CHAR_POS			# carrega em t0 o endereco de CHAR_POS
		
		
		# PRINTA O JOGADOR NA TELA #
		lw t2, position		
		li t3, 4			
		mul t2,t2,t3			# endereco do playerstate
		la t1,player_position		# tipos de movimentaÃ§ao personagem
		add t1,t1,t2			# t1 = sprite a ser impresso
		lw a0, 0(t1)			# carrega t1 (endereco do sprite) em a0
		lh a1,0(t0)			# carrega a posicao x do personagem em a1
		lh a2,2(t0)			# carrega a posicao y do personagem em a2
		mv a3,s0			# carrega o valor do frame em a3
		call PRINT			# imprime o sprite
		
		
		# PRINTA O INIMIGO QUE ANDA NA TELA #
		la t0,INI_POS			# carrega em t0 o endereco de CHAR_POS
		
		la a0,grinch			# carrega o endereco do sprite 'char' em a0
		lh a1,0(t0)			# carrega a posicao x do personagem em a1
		lh a2,2(t0)			# carrega a posicao y do personagem em a2
		mv a3,s0			# carrega o valor do frame em a3
		call PRINT			# imprime o sprite
		
		li t0,0xFF200604		# carrega em t0 o endereco de troca de frame
		sw s0,0(t0)			# mostra o sprite pronto para o usuario
		
		#####################################
		# Limpeza do "rastro" do personagem #
		#####################################
		la t0,OLD_CHAR_POS		# carrega em t0 o endereco de OLD_CHAR_POS
		
		la a0,footsteps			# carrega o endereco do sprite 'footsteps' em a0
		lh a1,0(t0)			# carrega a posicao x antiga do personagem em a1
		lh a2,2(t0)			# carrega a posicao y antiga do personagem em a2
		
		mv a3,s0			# carrega o frame atual (que esta na tela em a3)
		xori a3,a3,1			# inverte a3 (0 vira 1, 1 vira 0)
		call PRINT			# imprime
		xori a3,a3,0
		call PRINT
		
		la t0,OLD_INI_POS		# carrega em t0 o endereco de OLD_CHAR_POS
		
		la a0,footsteps			# carrega o endereco do sprite 'footsteps' em a0
		lh a1,0(t0)			# carrega a posicao x antiga do personagem em a1
		lh a2,2(t0)			# carrega a posicao y antiga do personagem em a2
		
		mv a3,s0			# carrega o frame atual (que esta na tela em a3)
		xori a3,a3,1			# inverte a3 (0 vira 1, 1 vira 0)
		call PRINT			# imprime
		xori a3,a3,0
		call PRINT

		j GAME_LOOP			# continua o loop

.include "src/inimigo.s"
.include "src/mmio.s"
.include "src/print.s"
.include "src/sounds.s"
.include "src/vitoria.s"
.include "SYSTEMv21.s"


.data

# sprites #
.include "sprites/vitoria.data"
.include "sprites/blocoindestrutivel.data"
.include "sprites/mapas/mapa1.data"
.include "sprites/mapas/mapa2.data"
.include "niveis/nivel2.data"
.include "niveis/nivel1.data"
.include "sprites/player/playerup.data"
.include "sprites/player/playerdown.data"
.include "sprites/player/playerleft.data"
.include "sprites/player/playerright.data"
.include "sprites/tile.data"
.include "sprites/presente.data"
.include "sprites/menu.data"
.include "sprites/footsteps.data"
.include "sprites/fundo.data"
.include "sprites/inimigos/grinch.data"
.include "sprites/inimigos/gremlin.data"
.include "sprites/coletaveis/sock.data"
.include "sprites/coletaveis/candy.data"
.include "sprites/derrota.data"
.include "sprites/fundo_quadrado.data"

# sprites de pontos #
.include "sprites/pontos/0kpontos.data"
.include "sprites/pontos/1kpontos.data"
.include "sprites/pontos/2kpontos.data"
.include "sprites/pontos/3kpontos.data"
.include "sprites/pontos/4kpontos.data"
.include "sprites/pontos/5kpontos.data"
.include "sprites/pontos/6kpontos.data"
.include "sprites/pontos/7kpontos.data"
.include "sprites/pontos/8kpontos.data"

