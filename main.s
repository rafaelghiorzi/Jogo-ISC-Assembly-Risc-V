.data
CHAR_POS:	.half 0,0			# x, y
OLD_CHAR_POS:	.half 0,0			# x, y


position: .word 0 # 0 = playerdown, 1 = playerup, 2=playerleft, 3=playerright
player_position: .word playerdown, playerup, playerleft, playerright
.text
SETUP:		la a0,fundo			# carrega o endereco do sprite 'fundo' em a0
		li a1,0				# x = 0
		li a2,0				# y = 0
		li a3,0				# frame = 0
		call PRINT			# imprime o sprite
		li a3,1				# frame = 1
		call PRINT			# imprime o sprite
		# esse setup serve pra desenhar o "fundo" nos dois frames antes do "jogo" comecar

GAME_LOOP:	call TECLA			# chama o procedimento de entrada do teclado
		
		xori s0,s0,1			# inverte o valor frame atual (somente o registrador)
		
		la t0,CHAR_POS			# carrega em t0 o endereco de CHAR_POS
		
		lw t2, position		
		li t3, 4			
		mul t2,t2,t3			# endereco do playerstate
		la t1,player_position		# tipos de movimentaçao personagem
		add t1,t1,t2			# t1 = sprite a ser impresso
		lw a0, 0(t1)			# carrega t1 (endereco do sprite) em a0
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
		
		la a0,footsteps			# carrega o endereco do sprite 'presente' em a0 - quero implementar ainda uma neve com passos pequenos
		lh a1,0(t0)			# carrega a posicao x antiga do personagem em a1
		lh a2,2(t0)			# carrega a posicao y antiga do personagem em a2
		
		mv a3,s0			# carrega o frame atual (que esta na tela em a3)
		xori a3,a3,1			# inverte a3 (0 vira 1, 1 vira 0)
		call PRINT			# imprime
		xori a3,a3,0
		call PRINT

		j GAME_LOOP			# continua o loop

.include "src/mmio.s"
.include "src/print.s"
.include "src/sounds.s"

.data

# sprites #
.include "sprites/player/playerup.data"
.include "sprites/player/playerdown.data"
.include "sprites/player/playerleft.data"
.include "sprites/player/playerright.data"
.include "sprites/tile.data"
.include "sprites/presente.data"
.include "sprites/menu.data"
.include "sprites/footsteps.data"
.include "sprites/fundo.data"
