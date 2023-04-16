#!/bin/bash

vermelho="\033[0;31m"
verde="\033[0;32m"

echo -e " \033[0;32m --------------------------- \033[0m"
echo -e " \033[0;32m Convertendo o Tamanho em MB \033[0m"
echo -e " \033[0;32m --------------------------- \033[0m"


read -p "Insira o tamanho " size

processo=$(bc <<< $size/1024)

echo O $size em Megabite é igual a $processo MB