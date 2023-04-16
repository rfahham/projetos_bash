#!/bin/bash

vermelho="\033[0;31m"
verde="\033[0;32m"

echo -e " \033[0;32m ---------------- \033[0m"
echo -e " \033[0;32m Executando While \033[0m"
echo -e " \033[0;32m ---------------- \033[0m"


read -p "Insira o comando a ser executado " cmd
read -p "Insira o tempo a ser executado (segundos)" tempo

while true; do $cmd; sleep $tempo; done