/* 
 *  Academia: N�cleo de Programa��o da Petrangol
 * Algoritmo : Jogo da Velha (X | 0) 
 * Autor : Paulo Pessoa
 * Disciplina : L�gica de Programa��o
 * Data e Hora : 26 de Fevereiro de 2021  |  3:38:14
 */


// vari�veis globais
	inteiro cont <- 0, i, j, L, op, vez, par <- 1
	literal jogo[3][3], x // guarda tanto X como
	logico vencedor
	
// procedimento para preencher a matriz
procedimento prencherMatriz()
	para i de 0 ate 2 aumentando
		para j de 0 ate 2 aumentando
			cont <- cont + 1
			jogo[i][j] <- strIntParaStr(cont)
		fimpara
	fimpara
fimprocedimento

// procedimento para desenhar a velha
procedimento desenharVelha()
	escreva "===================\n"
	escreva "  JOGO DA VELHA \n"
	escreva "+-----+-----+-----+\n"
	para i de 0 ate 2 aumentando
		para j de 0 ate 2 aumentando
			escreva "| "
			escreva jogo[i][j], "   "
		fimpara
		escreva "| \n"
		escreva "+-----+-----+-----+\n"
	fimpara
	escreva "===================\n"
fimprocedimento

// fun��o para verificar se existe um vencedor
funcao logico verificarVencedor()
	logico venceu <- falso

	// horizontal
	para i de 0 ate 2 aumentando 1
		se (jogo[i][0] = jogo[i][1]) e (jogo[i][1] = jogo[i][2]) entao
			venceu <- verdadeiro
		fimse
	fimpara

	// vertical
	para i de 0 ate 2 aumentando 1
		se (jogo[0][i] = jogo[1][i]) e (jogo[1][i] = jogo[2][i]) entao
			venceu <- verdadeiro
		fimse
	fimpara

	// diagonal 1
	se(jogo[0][0] = jogo[1][1]) e (jogo[1][1] = jogo[2][2]) entao
		venceu <- verdadeiro
	fimse

	// diagonal 2
	se (jogo[0][2] = jogo[1][1]) e (jogo[1][1] = jogo[2][0]) entao
		venceu <- verdadeiro
	fimse

	retorne venceu

fimfuncao

// procedimento para repetir a jogada
procedimento repetirJogada()
	vencedor <- verificarVencedor()
	vez <- vez + 1

	// verificar se j� tem um vencedor
	se vencedor = falso entao
		// trocar de jogador
		se par % 2 <> 0 entao // se for �mpar
			x <- "O"
		senao
			x <- "X"
		fimse
		par <- par + 1
	fimse
fimprocedimento

// procedimento para jogar
procedimento jogar()
	x <- "X"
	vencedor <- falso
	vez <- 0
	string mostrar_preenchido
	repita
		escreva "Digite um n�mero para ", x, ": "
		leia op
		se (op > 0) e (op < 10) entao
			se (op > 0) e (op < 4) entao
				L <- 0
			
				// verificar se o n�mero digitado j� est� preenchido
				se (jogo[L][op - 1] = "X") ou (jogo[L][op - 1] = "O") entao
				 	escreva ("Esse n�mero j� est� preenchido!")
				 	escreva "\n\n  Digite qualquer tecla, e ENTER para continuar... "
					leia mostrar_preenchido
				senao
					jogo[L][op - 1] <- x
					repetirJogada()
				fimse
			
			senao
				se (op > 3) e (op < 7) entao
					L <- 1
				
					// verificar se o n�mero digitado j� est� preenchido
					se (jogo[L][op - 4] = "X") ou (jogo[L][op - 4] = "O") entao
				 		escreva ("Esse n�mero j� est� preenchido!")
				 		escreva "\n\n  Digite qualquer tecla, e ENTER para continuar... "
						leia mostrar_preenchido
					senao
						jogo[L][op - 4] <- x
						repetirJogada()
					fimse
				
				senao
					L <- 2
					// verificar se o n�mero digitado j� est� preenchido
					se (jogo[L][op - 7] = "X") ou (jogo[L][op - 7] = "O") entao
				 		escreva ("Esse n�mero j� est� preenchido!")
				 		escreva "\n\n  Digite qualquer tecla, e ENTER para continuar... "
						leia mostrar_preenchido
					senao
						jogo[L][op - 7] <- x
						repetirJogada()
					fimse
				
				fimse
			fimse
		senao
			string opc_inval // mostrar na tela op��o inv�lida
			escreva "\nOp��o inv�lida!"
			escreva "\n\n  Digite qualquer tecla, e ENTER para continuar... "
			leia opc_inval
		fimse
		limpatela
		desenharVelha()
	ate (vencedor = verdadeiro) ou (vez = 9)

	// mostrar resultados
	se vencedor = verdadeiro entao
		escreva "O jogador ", x, " venceu.\n"
	senao
		escreva "DEU VELHA!!!\n"
	fimse
fimprocedimento

// fun��o principal
inicio
	prencherMatriz()
	desenharVelha()
	jogar()
fimalgoritmo