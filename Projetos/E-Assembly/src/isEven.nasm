; Arquivo: isEven.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2019
;
; Verifica se o valor salvo no endereço RAM[5] é
; par. Se for verdadeiro, salva 1
; em RAM[0] e 0 caso contrário.

 
; salvando 2 em ram[1] e depois em register D
leaw $4, %A
movw %A, %D
leaw $R1, %A
movw %D, (%A)

 
leaw $R5, %A 
movw (%A), %D
leaw $COPIA, %A
jge %D
nop
negw %D
 
COPIA:
 leaw $R3, %A
 movw %D, (%A)
 
LOOPMOD: 
 ; checa se o nosso valor provisório menos o dividendo é menor que zero, indicativo que já nao
 ; há mais divisões possíveis
 leaw $R3, %A 
 movw (%A), %D
 leaw $R1, %A
 subw %D, (%A), %D
 leaw $ENDMOD, %A
 jle %D
 nop
 leaw $R3, %A
 movw %D, (%A)
 leaw $LOOPMOD, %A
 jmp
 nop 
 
ENDMOD:
 ; pegamos o último valor da divisão salvo em %R3 e o armazenamos em %R2
 leaw $R3, %A
 movw (%A), %D
 leaw $R2, %A
 movw %D, (%A)
 
; verificando se o resultado da última subtração é 0 ou menor que 0
leaw $R2, %A
movw (%A), %D
leaw $PAR, %A
jl %D
nop
leaw $IMPAR, %A
jne %D
nop
 
PAR:
 ; salvando 1 em ram[0]
 leaw $1, %A
 movw %A, %D
 leaw $R0, %A
 movw %D, (%A)
 leaw $FIM, %A
 jmp
 nop
IMPAR:
 ; salvando 0 em ram[0]
 leaw $0, %A
 movw %A, %D
 leaw $R0, %A
 movw %D, (%A)
 leaw $FIM, %A
 jmp 
 nop
FIM:
