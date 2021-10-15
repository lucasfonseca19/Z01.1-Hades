; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Copia o valor de RAM[1] para RAM[0] deixando o valor sempre positivo.

leaw $R1, %A
movw (%A), %D

leaw $END, $A
jg %D
nop

negw %D 
jmp
nop

END:
leaw $R0, %A 
movw %D, (%A)