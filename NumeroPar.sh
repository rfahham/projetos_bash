#!/bin/bash

NumeroPar()
{
    echo " "
    echo "-------------------------------------"
    echo "Imprime os números pares de 0 até 100"
    echo "-------------------------------------"
    echo " "

    for NUM in $(seq 0 2 100)
    do
        echo "Número - $NUM"
    done
}

NumeroPar