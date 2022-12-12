#!/bin/bash

echo "----------------------"
echo "Trabalhando com arrays"
echo "----------------------"

DISTROS=( "Debian" "Trisquel" "Ubuntu" "RedHat")

echo "Imprimindo um array: "
echo $DISTROS
echo "----------------------"


echo "Chamando um dos elementos"
echo "----------------------"
echo $DISTROS[2]

echo "----------------------------------"
echo "Imprimindo quantidade de elementos"
echo "----------------------------------"
echo "O array lista possui ${#DISTROS[@]} elemento(s)"


# 45 formas de exibir elementos de um array

# http://terminalroot.com.br/2015/08/45-exemplos-de-variaveis-e-arrays-em_19.html


