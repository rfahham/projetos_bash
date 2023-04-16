#!/bin/bash

vermelho="\033[0;31m"
verde="\033[0;32m"

echo -e " \033[0;32m ------------------ \033[0m"
echo -e " \033[0;32m Calculando a idade \033[0m"
echo -e " \033[0;32m ------------------ \033[0m"

read -p "Entre com o ano do seu nascimento: " data

printf "%2d\n" $(date -d "-$(date +$data) year" +%Y)