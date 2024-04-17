#!/bin/bash

while true; do

echo "Qual a operação que deseja realizar?"
echo "1 - Multiplicação"
echo "2 - Divisão"
echo "3 - Soma"
echo "4 - Subtração"
read valor

read -p "Digite o primeiro valor: " valor1
sleep 0.5
read -p "Digite o segundo valor: " valor2

case $valor in 
    1) resultado=$((valor1 * valor2))
        opcao="Multiplicação";;
    2) resultado=$((valor1 / valor2))
        opcao="Divisão";;
    3) resultado=$((valor1 + valor2))
        opcao="Soma";;
    4) resultado=$((valor1 - valor2))
        opcao="Subtração";;
    *) echo "Opção Inválida!"
        exit 1;;
esac

echo "O resultado da $opcao é: $resultado"
echo ""

done