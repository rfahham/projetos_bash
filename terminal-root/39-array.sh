#!/bin/bash

# 39 - Criando um Array (Arranjo) “conjunto de variáveis”

DISTROS=("Debian" "Trisquel" "Ubuntu" "RedHat")

# Se você imprimir o Array DISTROS como variável, ele printará a variável 0 , o array exibe as variáveis nele contidas começando do 0 (zero), logo seria o mesmo de imprimir a ${DISTROS[0]}

echo "-----------------------------"
echo "Lista completa: \n"${DISTROS[*]}
echo "-----------------------------"

# 40 - Imprimir o elemento 1 da array DISTROS

echo ${DISTROS[0]}
echo ${DISTROS[1]}
echo ${DISTROS[2]}
echo ${DISTROS[3]}

DISTROS2=()

DISTROS2[0]="Debian-2"
DISTROS2[1]="Trisquel-2"
DISTROS2[2]="Ubuntu-2"
DISTROS2[3]="RedHat-2"


echo "-----------------------------"
echo "Lista completa do DISTRO2: \n"${DISTROS2[*]}
echo "-----------------------------"

DISTROS2[3]="Debian"
DISTROS2[2]="Trisquel"
DISTROS2[1]="Ubuntu"
DISTROS2[0]="RedHat"

echo "-----------------------------"
echo "Lista completa do DISTRO2: \n"${DISTROS2[*]}
echo "-----------------------------"

# 43 - Exibir Distro do elemento 2 até o final

echo ${DISTROS[@]:2} 

# 44 - Esta exibe os elementos com início na posição 1 seguidos de mais dois elementos consecutivos à posição 1

echo ${DISTROS[@]:1:2} 

# 45 - Saber quantos elementos possui o array DISTROS

echo ${#DISTROS[@]}

