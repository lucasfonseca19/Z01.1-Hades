; Arquivo: LCDQuadrado.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Desenhe um quadro no LCD

; Fazendo a linha superior do quadrado
leaw $16384, %A ; Define o valor do primeiro endereco da primeira linha do LCD
movw %A, %D
leaw $0, %A
movw %D, (%A) ; Salva o valor em RAM[0]

leaw $16403, %A ; Define o valor do ultimo endereco da primeira linha do LCD
movw %A, %D
leaw $1, %A
movw %D, (%A) ; Salva o valor em RAM[1]

LOOPLINHASUP: ; Loop para pintar todos os pixeis da primeira linha do LCD
leaw $1, %A
movw (%A), %D
leaw $0, %A
subw %D, (%A), %D ; RAM[1] - RAM[0]
leaw $ENDLOOPLINHASUP, %A 
jl %D ; Se essa subtracao der menor que 0, todos os pixeis da primeira linha estao pintados
nop

leaw $0, %A
movw (%A), %D
movw %D, %A
movw $-1, (%A) ; Pinta os 16px referentes a esse registrador
incw %D ; Incrementa um ao valor do registrador para pegar a proxima sequencia de 16px 
leaw $0, %A
movw %D, (%A)
leaw $LOOPLINHASUP, %A
jmp
nop

ENDLOOPLINHASUP:

; Fazendo a linha inferior do quadrado
leaw $21164, %A ; Define o valor do primeiro endereco da ultima linha do LCD
movw %A, %D
leaw $2, %A
movw %D, (%A) ; Salva o valor em RAM[2]

leaw $21183, %A ; Define o valor do ultimo endereco da ultima linha do LCD
movw %A, %D
leaw $3, %A
movw %D, (%A) ; Salva o valor em RAM[3]

LOOPLINHAINF: ; Loop para pintar todos os pixeis da ultima linha do LCD
leaw $3, %A
movw (%A), %D
leaw $2, %A
subw %D, (%A), %D ; RAM[3] - RAM[2]
leaw $ENDLOOPLINHAINF, %A 
jl %D ; Se essa subtracao der menor que 0, todos os pixeis da ultima linha estao pintados
nop

leaw $2, %A
movw (%A), %D
movw %D, %A
movw $-1, (%A) ; Pinta os 16px referentes a esse registrador
incw %D ; Incrementa um ao valor do registrador para pegar a proxima sequencia de 16px 
leaw $2, %A
movw %D, (%A)
leaw $LOOPLINHAINF, %A
jmp
nop

ENDLOOPLINHAINF:

; Fazendo a linha esquerda do quadrado
; Para isso, o vetor de bits que sera salvo no primeiro endereco de cada linha
; sera o vetor 1000000000000000, que corresponde ao numero -32768 em decimal
leaw $32768, %A ; Salvando o valor no registrador A
negw %A ; Negando esse valor
movw %A, %D
leaw $4, %A 
movw %D, (%A) ; Salva o valor -32768 em binario em RAM[4]

leaw $16384, %A ; Define o valor do primeiro endereco da primeira linha
movw %A, %D
leaw $5, %A
movw %D, (%A) ; Salva o valor em RAM[5]

leaw $21164, %A ; Define o valor do primeiro endereco da ultima linha
movw %A, %D
leaw $6, %A
movw %D, (%A) ; Salva o valor em RAM[6]

LOOPLINHAESQ: ; Loop para pintar o primeiro pixel do primeiro endereco de cada linha
leaw $6, %A
movw (%A), %D
leaw $5, %A
subw %D, (%A), %D ; RAM[6] - RAM[5]
leaw $ENDLOOPLINHAESQ, %A
jl %D ; Se essa subtracao der menor que 0, todos os primeiros pixeis de cada linha estao pintados
nop

leaw $4, %A
movw (%A), %D
leaw $5, %A
movw %D, (%A) ; Pinta o primeiro pixel desse endereco, que sera sempre do primeiro endereco de uma linha
movw %A, %D
leaw $20, %A
addw %D, %A, %D ; Incrementa 20 ao endereco do LCD para pegar a proxima linha
leaw $5, %A
movw %D, (%A)
leaw $LOOPLINHAESQ, %A
jmp
nop

ENDLOOPLINHAESQ:

; Fazendo a linha direita do quadrado
; Para isso, o vetor de bits que sera salvo no primeiro endereco de cada linha
; sera o vetor 0000000000000001, que corresponde ao numero 1 em decimal

leaw $16403, %A ; Define o valor do ultimo endereco da primeira linha
movw %A, %D
leaw $7, %A
movw %D, (%A) ; Salva o valor em RAM[7]

leaw $21183, %A ; Define o valor do ultimo endereco da ultima linha
movw %A, %D
leaw $8, %A
movw %D, (%A) ; Salva o valor em RAM[8]

LOOPLINHADIR: ; Loop para pintar o ultimo pixel do ultimo endereco de cada linha
leaw $8, %A
movw (%A), %D
leaw $7, %A
subw %D, (%A), %D ; RAM[8] - RAM[7]
leaw $ENDLOOPLINHADIR, %A
jl %D ; Se essa subtracao der menor que 0, todos os ultimos pixeis de cada linha estao pintados
nop

leaw $1, %A
movw %A, %D
leaw $7, %A
movw %D, (%A) ; Pinta o ultimo pixel desse endereco, que sera sempre do ultimo endereco de uma linha
movw %A, %D
leaw $20, %A
addw %D, %A, %D ; Incrementa 20 ao endereco do LCD para pegar a proxima linha
leaw $7, %A
movw %D, (%A)
leaw $LOOPLINHADIR, %A
jmp
nop

ENDLOOPLINHADIR:











