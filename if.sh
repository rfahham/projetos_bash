echo "Somando dois números"

read -p "Informe o primeiro número: " valor1
read -p "Informe o segundo número: " valor2

echo "Primeiro número: "$valor1
echo "Segundo número: "$valor2

total=$(expr $valor1 + $valor2)

echo "Valor total é de: "$total

echo "-------------------------------------------------"

read -p "Digite um nome: "myname
echo "${myname:=$(whoami)}"

echo "-------------------------------------------------"

read -p "Informe seu nome: " nome 
read -p "Informe seu sobrenome: " sobrenome

echo $nome $sobrenome

echo "-------------------------------------------------"

# if [ $valor1 < $valor2 ]; then
#     echo "$valor1 é menor que $valor2."
# else
#     echo "$valor1 é maior que $valor2."
# fi
# echo "-------------------------------------------------"
# if [ $valor1 = $valor2 ]; then
#     echo "Parametro 1 ($valor1) é igual a 2 ($valor2)."
# else
#     echo "Parametro 1 ($valor1) não é igual a 2 ($valor2)."
# fi
# echo "-------------------------------------------------"
# if [ $valor1 > $valor2 ]; then
#     echo "Parametro 1 ($valor1) é maior que parametro 2 ($valor2)."
# else
#     echo "Parametro 1 ($valor1) é menor que parametro 2 ($valor2)."
# fi

# echo "-------------------------------------------------"

# if [ $valor1 > $valor2 ]; then
#     echo "Parametro 1 ($valor1) é maior que parametro 2 ($valor2)."
# if [ $valor1 < $valor2 ]; then
#     echo "Parametro 1 ($valor1) é menor que parametro 2 ($valor2)."
# if [ $valor1 = $valor2 ]; then
#    echo "Parametro 1 ($valor1) é igual ao  parametro 2 ($valor2)."
# fi

# [ $valor1 = $valor2 ] && { echo "Parametro 1 ($valor1) é igual a 2 ($valor2)."; exit 0; }

# [ $valor1 > $valor2 ] && { echo "Parametro 1 ($valor1) é maior a 2 ($valor2)."; exit 0; }

# [ $valor1 < $valor2 ] && { echo "Parametro 1 ($valor1) é menor a 2 ($valor2)."; exit 0; }