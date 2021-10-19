; Arquivo: LCDQuadrado.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Desenhe uma linha no LCD

; Pintando a primeira linha do LCD
leaw $16384, %A ; Define o valor do primeiro endereco da primeira linha do LCD
movw %A, %D
leaw $0, %A
movw %D, (%A) ; Salva o valor em RAM[0]

leaw $16403, %A ; Define o valor do ultimo endereco da primeira linha do LCD
movw %A, %D
leaw $1, %A
movw %D, (%A) ; Salva o valor em RAM[1]

LOOPLINHA: ; Loop para pintar todos os pixeis da primeira linha do LCD
leaw $1, %A
movw (%A), %D
leaw $0, %A
subw %D, (%A), %D ; RAM[1] - RAM[0]
leaw $ENDLOOPLINHA, %A 
jl %D ; Se essa subtracao der menor que 0, todos os pixeis da primeira linha estao pintados
nop

leaw $0, %A
movw (%A), %D
movw %D, %A
movw $-1, (%A) ; Pinta os 16px referentes a esse registrador
incw %D ; Incrementa um ao valor do registrador para pegar a proxima sequencia de 16px 
leaw $0, %A
movw %D, (%A)
leaw $LOOPLINHA, %A
jmp
nop

ENDLOOPLINHA:
