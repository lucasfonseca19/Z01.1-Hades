; Arquivo: Pow.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Eleva ao quadrado o valor da RAM[1] e armazena o resultado na RAM[0].
; Só funciona com números positivos

leaw $R1,%A
movw (%A), %D
leaw $R2,%A
movw %D, (%A)

LOOP:
    leaw $R1, %A
    movw (%A), %D
    leaw $R0, %A
    addw (%A), %D, %D
    movw %D, (%A)

    leaw $R2, %A
    movw (%A), %D
    decw %D
    movw %D, (%A)

    leaw $LOOP, %A
    jne %D
    nop

