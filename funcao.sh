#!/bin/bash

echo ""
read -p "Escolha a operação: (Soma, Subtracao, Multiplicacao, Divisao): " operacao
echo ""

Soma(){

	echo "-------------------------------------------------"
	echo "Somando dois números"
	echo ""
	read -p "Informe o primeiro número: " valor1
	read -p "Informe o segundo número: " valor2
	echo ""
	echo "Primeiro número $valor1 e o segundo número é $valor2"

	total=$(expr $valor1 + $valor2)
	echo ""
	echo "Valor total é de: "$total

	echo "-------------------------------------------------"
	echo ""
}

Subtracao(){

	echo "-------------------------------------------------"
	echo "Subtraindo dois números"
	echo ""
	read -p "Informe o primeiro número: " valor1
	read -p "Informe o segundo número: " valor2
	echo ""
	echo "Primeiro número $valor1 e o segundo número é $valor2"

	total=$(expr $valor1 - $valor2)
	echo ""
	echo "Valor total da subtração é de: "$total

	echo "-------------------------------------------------"
	echo ""
}

Multiplicacao(){

	echo "-------------------------------------------------"
	echo "Multiplicando dois números"
	echo ""
	read -p "Informe o primeiro número: " valor1
	read -p "Informe o segundo número: " valor2
	echo ""
	echo "Primeiro número $valor1 e o segundo número é $valor2"

	total=$(expr $valor1 \* $valor2)
	echo ""
	echo "Valor total é de: "$total

	echo "-------------------------------------------------"
	echo ""
}

Divisao(){

	echo "-------------------------------------------------"
	echo "Dividindo  dois números"
	echo ""
	read -p "Informe o primeiro número: " valor1
	read -p "Informe o segundo número: " valor2
	echo ""
	echo "Primeiro número $valor1 e o segundo número é $valor2"

	total=$(expr $valor1 / $valor2)
	echo ""
	echo "Valor total é de: "$total

	echo "-------------------------------------------------"
	echo ""
}

$operacao
