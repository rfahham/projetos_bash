#!/bin/bash

echo "------------------------------"
echo "Criando instâncias, aguarde..."
echo "------------------------------"

make create

sleep 20

echo "---------------------"
echo "Executando o setup..."
echo "---------------------"

make setup

sleep 300

clear

x=1
cenarios=("cenário-1" "cenário-2" "cenário-3" "cenário-4" "cenário-5" "cenário-6")
echo ${cenarios[2]}

while [ $x -lt 6 ]

    do
            echo "--------------------------------"
            echo "Executando" ${cenarios[x]}", aguarde..."
            echo "--------------------------------"

            make cmd

            echo "1"
            echo ${cenarios[x]}
            echo run -d120s -u10 ${cenarios[x]}.js

            sleep 60

            make updoad

            x= x+1
            echo $x

            sleep 60
    done



echo "--------------------------------"
echo "Removendo instâncias, aguarde..."
echo "--------------------------------"

make destroy

echo "-------------------------------"
echo "Setup executado com sucesso !!!"
echo "-------------------------------"