.data
TAMANHO: 29
NOTAS: 60,469,60,234,62,234,60,234,59,234,57,469,57,469,57,469,62,469,62,234,64,234,62,234,60,234,59,469,55,469,55,469,64,469,64,234,65,234,64,234,62,234,60,469,57,469,55,234,55,234,57,469,62,469,59,469,60,938

.text
	
MUSICA:	la s0,TAMANHO		# define o endere�o do n�mero de notas
	lw s1,0(s0)		# le o numero de notas
	la s0,NOTAS		# define o endere�o das notas
	li t0,0			# zera o contador de notas
	li a2,88		# define o instrumento
	li a3,100		# define o volume

LOOP:	beq t0,s1, FIM_MUSICA	# contador chegou no final? ent�o  v� para FIM
	lw a0,0(s0)		# le o valor da nota
	lw a1,4(s0)		# le a duracao da nota
	li a7,31		# define a chamada de syscall
	ecall			# toca a nota
	mv a0,a1		# passa a dura��o da nota para a pausa
	li a7,32		# define a chamada de syscal 
	ecall			# realiza uma pausa de a0 ms
	addi s0,s0,8		# incrementa para o endere�o da pr�xima nota
	addi t0,t0,1		# incrementa o contador de notas
	j LOOP			# volta ao loop
	
FIM_MUSICA:
	li a0, 0
	li a1, 0
	li a2, 0
	li a3, 0
	li t0, 0
	li s0, 0
	li s1, 0
	# reseta as vari�veis e continua a vida
	ret
	
ANDAR:
	li a0, 60 # middle C
	li a1, 100 # pra andar
	li a2, 105
	li a3, 100 #volume
	li a7, 32
	ecall
	ret
	
