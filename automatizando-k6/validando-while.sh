#!/bin/bash

x=0
cenarios=("cenario1.js" "cenario2.js" "cenario3.js" "cenario4.js" "cenario5.js" "cenario6.js")

while [ $x -lt 6 ]
do
    echo "----------------------------------"
    echo "Executando" ${cenarios[x]}", aguarde..."
    echo "----------------------------------"

    k6 run -d30s -u10 ${cenarios[x]}

    let "x = x +1"

    sleep 60
done