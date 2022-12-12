#!/bin/bash

clear
echo "-----------------"
echo "Executar comandos"
echo "-----------------"
cat -n comandos.txt
read -p "Escolha uma opção: " nlinha
selecionado=`sed "$nlinha !d" comandos.txt`
echo "O comando escolhido foi: $selecionado"
$selecionado