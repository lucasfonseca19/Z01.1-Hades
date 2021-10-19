; ------------------------------------------------------------
; Arquivo: Mod.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017
;
; Calcula o resto da divisão (modulus) entre RAM[0] por RAM[1]
; e armazena o resultado na RAM[2].
;
; 4  % 3 = 1
; 10 % 7 = 3
; ------------------------------------------------------------

; copiando o que tem em r0 para r3
leaw $R0, %A 
movw (%A), %D
leaw $R3, %A
movw %D, (%A)


LOOP:    
    ; checa se o nosso valor provisório menos o dividendo é menor que zero, indicativo que já nao
    ; há mais divisões possíveis
    leaw $R3, %A 
    movw (%A), %D
    leaw $R1, %A
    subw %D, (%A), %D
    leaw $END, %A
    jl %D
    nop
    ; casa contrário subtrai o dividendo do nosso valor provisório
    leaw $R3, %A
    movw %D, (%A)
    leaw $LOOP, %A
    jmp
    nop 

END:
    ; pegamos o último valor da divisão salvo em %R3 e o armazenamos em %R2
    leaw $R3, %A
    movw (%A), %D
    leaw $R2, %A
    movw %D, (%A)
