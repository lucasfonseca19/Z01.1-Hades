# Lab 3: Transistores / CI

!!! info "Sugestão de como trabalhar"
    1. Realizar individual
    1. Ficar online no canal do grupo para discutir e tirar dúvidas com os colegas/professores

Esse laboratório tem como objetivo trabalhar com os conceitos básicos de portas lógicas do tipo RTL realizadas a base de transistores discretos do tipo BJT e também trabalhar com componentes integrados (CI) da família CMOS.

Existem basicamente três níveis de simulação de componentes eletrônicos: a primeira, puramente lógica utiliza de portas lógicas "ideais" (https://simulator.io/board). Um simulador mais preciso irá utilizar transistores para a implementação dessas portas lógicas porém não leva em consideração todos os fatores físicos-eletrônicos dos componentes (http://falstad.com/circuit/). Já um simulador que leva em consideração as propriedades dos componentes é chamado de SPICE e irá gerar uma simulação mais precisa em termos físicos do circuito original (http://circuitlab.com).

<button class="button0" id="0:comencado" onClick="progressBut(this.id);">Cheguei Aqui!</button>

## Parte 1 - Circuito misterioso

Vamos usar o simulador do site falstad para implementar um circuito feito com transistores que implementa uma equação booleana. 

1. Abra o site: http://www.falstad.com/circuit/
1. :arrow_right: Arquivo :arrow_right: Importar Arquivo Texto :arrow_right: Copiar e colar o texto a seguir

```
$ 1 0.000005 10.20027730826997 52 5 50
R 368 64 320 64 0 0 40 6 0 0 0.5
g 368 432 368 496 0
t 320 208 368 208 0 1 -2.4273420612275154 0.6036514634436996 100
w 368 160 368 192 0
t 320 256 368 256 0 1 0.5145133301062574 0.6054914059129475 100
w 368 224 368 240 0
w 368 272 368 288 0
w 368 368 368 384 0
r 320 208 240 208 0 2000
r 240 256 320 256 0 2000
L 240 208 208 208 0 1 false 3.6 0
L 240 256 208 256 0 1 false 3.6 0
r 368 288 368 368 0 2000
r 368 288 448 288 0 2000
t 448 288 496 288 0 1 -3.1219716002696054 -0.07756831971486333 100
t 448 368 496 368 0 1 -5.999999999780089 -2.9555967192253467 100
w 448 368 320 368 0
r 320 368 224 368 0 2000
w 496 272 496 160 0
w 496 160 368 160 0
w 368 160 368 64 0
w 496 352 544 352 0
w 544 352 544 160 0
w 544 160 496 160 0
w 496 304 576 304 0
w 496 384 576 384 0
w 576 384 576 304 0
r 576 400 576 464 0 1000
w 368 432 368 384 0
g 576 448 576 496 0
M 576 384 640 384 0 2.5
L 224 368 208 368 0 0 false 5 0
w 576 400 576 384 0
```

Vocês devem obter o seguinte diagrama:

![](figs/A-Transistores/simulacao.gif){width=400}

Com o circuito carreado no site, encontre:

!!! example "Tarefa"
    1. Encontre a tabela verdade do circuito.
        - Faça todas as combinações possíveis de entradas (H/L) e verifique o valor da saída (H/L)
    1. A partir da tabela verdade encontre a equação lógica.
    1. Desenhar o diagrama da equação (simplificado).

<button class="button0" id="1:circuito_misterioso" onClick="progressBut(this.id);">Cheguei Aqui!</button>

## Parte 2 - RTL

!!! note "Modo online"
    Esta atividade seria realizada no laboratório com hardware real, quando
    começarmos ter encontros presenciais podemos realizar o experimento de
    forma real.

Iremos implementar portas lógicas e equações booleanas com transistores BJT. Para isso vamos utilizar o [TinkerCad](https://www.tinkercad.com/), que irá permitir realizarmos uma montagem similar a que seria feito no laboratório.


<!---
### Material

Cada grupo receberá:

- Duas protoboards
- Duas baterias 9V
- Jumpers macho-macho
- 12 transistores [BJT-N BC337](https://www.onsemi.com/pub/Collateral/BC337-D.PDF)
- 24 resistores de 2k
- 6 LEDs coloridos (Vermelho, amarelo e verde)

![](figs/A-Transistores/materiais.jpg)

### Trabalhando

O grupo deve se organizar e executar da melhor forma possível (com todos participando) os módulos a seguir, utilizando:

- Entradas: Utilizar como entrada do sistema (A,B,C,...) **jumpers** que estarão hora conectados em **GND (0)** ou **VCC (1)**. 
- Saídas: A saída final do sistema deve ser representada com um LED, sendo aceso indicando lógica `1` e apagado lógica `0`.
- Validação: Uma tabela verdade do circuito deve ser apresentada e em aula demonstrado que o circuito representa a tabela.
-->

----------------------

### a - NOT

<!---
**Cada grupo deve realizar duas** implementações do circuito a seguir que representa uma NOT:
-->

Iremos implementar uma porta lógica do tipo NOT usando transistores BJT. 

![RTL Not](figs/A-Transistores/rtl-not.png){width=500}

Para isso vocês deverão:

1. Entrar no site [TinkerCad](https://www.tinkercad.com/)
1. Logar (com google) e criar conta **pessoal**
1. **Circuis** :arrow_right: **Criar novo Circuito**
1. Fazer a implementação a seguir

![Protoboard](figs/A-Transistores/rtl-not-protoboard.png)

<!--
!!! warning
    Se você perceber que algum transistor está aquecendo,
    desconecte a bateria e verifique novamente a montagem.
    Isso é um sinal que alguma coisa está errada.
-->

!!! example "Tarefa"
    Levante a tabela verdade do circuito recém montado, é uma `not`?

!!! tip
    - Utilize o [datasheet](https://www.onsemi.com/pub/Collateral/BC337-D.PDF) do transistor para entender a montagem

    - Mexa na chave para aplicar `0` ou `1` na entrada do circuito.

!!! note "Solução"
    https://www.tinkercad.com/things/bnWLvsuRvp6-neat-lappi-snicket/editel?sharecode=QlWtWTyxH18eCaVwphNPVTpzdXW9IlssdNUmgLUOtAU

<button class="button0" id="2:rtl-not" onClick="progressBut(this.id);">Cheguei Aqui!</button>

<!--
!!! tip
    O fio 'rosa' da imagem anterior representa a entrada do seu circuito, você deve colocar ela em `GND` para simular uma entrada `0` e em `VCC` para simular uma entrada `1`.
-->

    
<!--
### 1b - NOT NOT

Agora que as duas `NOT` foram implementadas, testadas e estão funcionado, conecte a saída de uma na entrada da outra. Isso vai fazer com que a saída siga o valor de referência da entrada.

![not not A](figs/A-Transistores/notnot.png){width=300}

!!! example "Exercício 1b"
    Levante a tabela verdade do circuito recém montado

!!! example "Tarefa"
    1. Levante a tabela verdade do circuito recém montado.
    1. Qual porta lógica é essa?
-->

----------------------

### b - OR

<!---
**Cada grupo deve realizar duas** implementações do circuito a seguir que representa uma NOT:
-->

Implemente uma porta lógica do tipo OR usando transistores BJT. Essa porta terá duas entradas e uma saída, cada entrada deve ser uma chave e a saída um LED.

!!! tip 
    Utilize a página a seguir para ter ideias de como implementar as portas lógicas em RTL:
    
    -  http://hyperphysics.phy-astr.gsu.edu/hbase/Electronic/trangate.html#c2

<button class="button0" id="3:rtl-or" onClick="progressBut(this.id);">Cheguei Aqui!</button>

----------------------

### c - Equação

Implemente a equação lógica a seguir em um circuito do tipo RTL. 

```
Q = A.(A.(A+B)+A.C)
```

<!--
!!! warning 
    Vocês devem conseguir paralelizar a execução dessa equação, para isso divida o grupo e cada um faz uma parte da equação, depois junte tudo!
-->
    
!!! example "Tarefa"
    1. Implemente a equação no TinkerCad
    1. Para validar valide com tabela verdade do circuito 
        - **As duas tabelas precisam ser idênticas!** 

!!! tip
    1. Da para simplificar?
    1. Antes de montar, faça o diagrama de blocos!

<button class="button0" id="4:rtl-equacao" onClick="progressBut(this.id);">Cheguei Aqui!</button>

## Circuitos Integrados - CI

Circuitos integrados são componentes eletrônicos que possuem internamente dezenas a milhares de transistores que implementam circuitos eletrônicos, facilitando e possibilitando o desenvolvimento de projetos de hardware mais complexos.

Existem várias 'famílias' de CI que implementam portas lógicas, iremos trabalhar com uma versão chamada de série [TTL 7400](https://pt.wikipedia.org/wiki/S%C3%A9rie_7400). Exemplos de componentes dessa famílias:

- 7400: Quatro portas NAND de duas entradas
- 7401: Quatro portas NAND de duas entradas com coletor aberto
- 7402: Quatro portas NOR de duas entradas
- 7403: Quatro portas NAND de duas entradas com coletor aberto
- 7404: Seis inversores (porta NOT)

> Para a lista completa acesse: https://pt.wikipedia.org/wiki/Lista_dos_circuitos_integrados_da_s%C3%A9rie_7400

Vamos continuar no [TinkerCad](https://www.tinkercad.com/).

### a - NOT

Vamos usar o componente [7404](https://pt.wikipedia.org/wiki/TTL_7404) que possui 6 NOTs para fazer a mesma coisa que fizemos com os transistor discreto:

![](figs/A-Transistores/7404-pcb.png)

!!! note "7404"
    Para mais informações, acesse:  https://pt.wikipedia.org/wiki/TTL_7404
   
    ![](figs/A-Transistores/7404.png)

!!! note "Solução"
    - https://www.tinkercad.com/things/5didIR3U6qY-sizzling-jaban-jarv/editel?tenant=circuits?sharecode=2N6uVn_CZekje82phPIUcZu_24lOLu1_oeEenH-htT8

<button class="button0" id="5:ci-not" onClick="progressBut(this.id);">Cheguei Aqui!</button>

----------------------

### b - Equação

Implemente a equação que foi realizada com transistores só que agora com CIs da família 74xx.

```
Q = (A xor B) or not(C)
```

!!! tip
    1. Identifique os componentes
    1. Procure na [lista](https://pt.wikipedia.org/wiki/Lista_dos_circuitos_integrados_da_s%C3%A9rie_7400) qual o seu nome
    1. Analise os pinos desse componente
    1. Faça a ligação e teste por parte

<button class="button0" id="6:ci-equacao" onClick="progressBut(this.id);">Cheguei Aqui!</button>

## Praticando no papel

> Questão extraida do EXAME NACIONAL DE DESEMPENHO DOS ESTUDANTES 2014

Um processo monitora três parâmetros para controle de qualidade: `A`, `B`, `C`. Cada parâmetro possui um
valor na decisão final da qualidade. A existência do parâmetro `A` pesa 30% na decisão final, enquanto os
parâmetros `B` e `C` pesam 30% e 40%, respectivamente. O grau de aprovação do processo é dado pela soma
dos percentuais desses três parâmetros. O produto gerado pelo processo é considerado aprovado, caso o
grau de qualidade seja superior ou igual a 60%, e reprovado, se o grau de qualidade for inferior ou igual a
30%.

Caso o grau de qualidade esteja entre 30% e 60%, a decisão de aprovação ou reprovação é indiferente.
Por exemplo, se um produto apresentar os parâmetros `A` e `B`, terá grau de qualidade de 30%+30% = 60%,
levando à sua aprovação.

Com base na situação descrita, projete um circuito lógico com o menor número possível de portas lógicas,
para determinar a aprovação ou não do produto de acordo com a presença de seus parâmetros. As entradas
do circuito serão os sinais `A`, `B`,`C`, e a saída será um sinal `Z`. Para atingir esse objetivo, faça o que se pede nos itens a seguir.

1. Monte uma tabela verdade do sistema com a formação `A`, `B`, `C`. (valor: 4,0 pontos)
1. Desenhe o circuito final otimizado utilizando portas lógicas. (valor: 6,0 pontos)
1. *(extra, não tinha no enade)* Implemente a lógica encontrada com CIs da família 74xx
 
<button class="button0" id="7:extra" onClick="progressBut(this.id);">Cheguei Aqui!</button>
