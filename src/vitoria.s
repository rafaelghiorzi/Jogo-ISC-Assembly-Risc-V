VITORIA:
la a0,vitoria 			# endereço do menu para printar
li a1,0				# x = 0
li a2,0				# y = 0
li a3,0				# frame = 0
call PRINT
li a3,1
call PRINT

OUTRO_LOOP:
	call SAIDA
	j OUTRO_LOOP
	
SAIDA:
	li t1,0xFF200000		# carrega o endereco de controle do KDMMIO
	lw t0,0(t1)			# Le bit de Controle Teclado
	andi t0,t0,0x0001		# mascara o bit menos significativo
   	beq t0,zero,FIM2   	   	# Se nao ha tecla pressionada entao vai para FIM
  	lw t2,4(t1)  			# le o valor da tecla tecla
		
	li t0,' '
	beq t2,t0,EXIT			# se tecla pressionada for 'space', vai para o SETUP do main
		
	li t0,'2'
	beq t2,t0,EXIT			# se tecla pressionada for '2', sai do programa
	
FIM2:	ret				# retorna

EXIT:	li a7, 10
	ecall