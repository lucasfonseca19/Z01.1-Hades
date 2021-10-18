; Arquivo: stringLength.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi 
; Data: 28/03/2018
;
; Assuma que uma string é um conjunto de caracteres terminado
; em NULL (0).
; 
; Supondo que temos uma string que começa no endereço 8 da RAM.
; Calcule o seu tamanho e salve o resultado na RAM[0].
;
; Os caracteres estão formatados em ASCII
; http://sticksandstones.kstrom.com/appen.html
; 
; Exemplo:
;
;   Convertido para ASCII
;             |
;             v
;  RAM[8]  = `o`
;  RAM[9]  = `i`
;  RAM[10] = ` `
;  RAM[11] = `b`
;  RAM[12] =  l`
;  RAM[13] = `z`
;  RAM[14] = `?`
;  RAM[15] = NULL = 0x0000

;Apontando A para RAM[8]
leaw $R8, %A
;Pegando o endereço de RAM[8] e colocando em D
movw %A, %D
;Apontando A para RAM[0]
leaw $R0, %A
;salvando o endereço de RAM[8] em RAM[0]
movw %D, (%A) 

LOOP: 

    ;faz A apontar para RAM[0]
    leaw $R0, %A
    ; pegamos o contéudo de A e passamos para o registador D
    movw (%A), %D
    ; incrementamos o registrador D e salvamos em RAM[0]
    addw $1, %D, (%A) 
    ; pega o que está em RAM[0] (o novo endereço de memória)e salva no register A
    movw (%A), %A
    ; nesse novo endereço de memória pegamos o conteúdo e salvamos no register D
    movw (%A),%D
    ; caso seja maior que zero, loop
    leaw $LOOP, %A 
    jg %D 
    nop
; quando chegar a zero iremos fazer a diferença entre a posição atual e ram[8]

leaw $R0, %A 
movw (%A), %D
leaw $R8, %A
subw %D, %A, %D 
leaw $R0, %A 
movw %D, (%A)






