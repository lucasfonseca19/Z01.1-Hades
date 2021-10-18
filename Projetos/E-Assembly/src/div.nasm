; Arquivo: Div.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Divide R0 por R1 e armazena o resultado em R2.
; (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
; divisao para numeros inteiros positivos

WHILE:
leaw $R1, %A
movw (%A), %D
leaw $R0, %A

subw (%A), %D, %D

;Para incrementar da maneira correta a divisao de inteiros devemos manipular os dois registradores e RAM[%A]
;Posteriormente voltando ao valor inicial de D e continuando a divisao

movw %D, (%A)
leaw $R2,%A
movw (%A), %D

incw %D

movw %D, (%A)
leaw $R0, %A 

movw (%A), %D

leaw $WHILE, %A
jg %D
nop



























































