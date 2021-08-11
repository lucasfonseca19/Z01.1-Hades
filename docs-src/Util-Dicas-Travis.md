# Dicas Travis

## Adicionando teste ao projeto

Edite o arquivo `.travis.yml` localizado na raiz do repositório, adicionando o script que deseja testar. Exemplos, para testarmos o projeto B é necessário adicionar ao `Travis` a seguinte linha:

```
python3 Projetos/B-LogicaCombinacional/testeLogicaCombinacional.py 
```

Isso deve ser feito na parte referente ao `script`

``` yml
script:
  ## Instal Z01.1 tools
  - bash updateZ01tools.sh 

  ## run scripts
  - python3 Projetos/A-AmbienteDesenvolvimento/testeAmbienteDesenvolvimento.py
  - python3 Projetos/B-LogicaCombinacional/testeLogicaCombinacional.py 
```

!!! warning
    Você não deve remover os testes antigos
