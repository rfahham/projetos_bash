#!/bin/bash

# 19 - Testa uma operação aritmética, retornando 0 ou 1

echo $((11<9))

# 20 - Retorna o resultado de uma operação aritmética
echo $((110-90))


# 21 - Testa uma expressão, retornando 0 ou 1 (alias do comando ‘test’)

var1=5
var2=3

[ 5 -gt 3 ] && echo 'É maior!'

echo "Usando variáveis"
[ $var1 -gt $var2 ] && echo 'É maior!'

# 22 - Testa uma expressão, retornando 0 ou 1 (podendo usar && e ||)

var=10
[[ $var ]] && echo 'Existe essa variável' && echo $var