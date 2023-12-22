# Bad Santa versão alternativa
O trabalho a seguir é uma releitura do jogo Bad Ice Cream, desenvolvido pela empresa Nitrome em Dezembro de 2010.
O jogo foi programado na linguagem Assembly Risc-V R32 com auxílio do simulador RARS (RISC-V Assembler and Runtime Simulator).
Criado por Rafael Ghiorzi, Guilherme Lima e Bernardo Vilar

# Nota da versão alternativa
O trabalho final foi completamente baseado em macros e matrizes para funcionar, porém antes de conseguirmos consertar os bugs, 
estávamos desenvolvendo uma versão alternativa em que a colisão do personagem e do inimigo era feito de uma forma completamente
diferente, porém às custas da não implementação das barreiras de presentes. Se quiserem dar uma olhada, sintam-se à vontade!

# Nota para os alunos da disciplina Introdução a Sistemas Computacionais
O código contido nesse repositório pode ser e deve ser usado como inspiração para os futuros projetos relacionados a essa disciplina.
Boa parte do código está comentado e a maioria é simples de entender para quem já tem um bom conhecimento prévio da 
linguagem Assembly RISC-V. É imprescindível que você estudante assista os vídeos tutoriais contidos no [repositório de ISC e OAC](https://github.com/victorlisboa/LAMAR)

O jogo está configurado para ser rodado com o bitmap display dentro do RARS, se você quiser ver o funcionamento do jogo no FPGRARS, basta mudar a seção do código Main que conta a quantidade de iterações do loop GAME_LOOP (Atualmente - li t6, 150)  para um número muito maior, 20000 para cima (isso é o quão mais rápido ele é)

Qualquer dúvida, sinta-se a vontade de mandar um email para rafael.ghiorzi@gmail.com

Se você quiser aprender mais sobre o uso do FPGRARS e como ele funciona em qualquer outro sistema operacional que não seja windows, vale a pena checar o repositório do criador do sistema: https://github.com/LeoRiether/FPGRARS

## Artigo do projeto
O relatório do projeto está incluido nos arquivos do repositório, o nome é autoexplicativo
