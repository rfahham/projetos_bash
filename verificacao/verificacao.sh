#!/bin/bash

verde="\033[0;32m"
vermelho="\033[0;31m"

read -p "Informe o comando: " comando

# verifica o comando e caso de erro joga a informação para um arquivo
$comando 2>>logs.txt
if [ $? -eq 0 ]
then
    echo ""
    echo -e " \033[0;32m --------------------------------- \033[0m "
    echo -e " \033[0;32m Comando executado com sucesso !!! \033[0m "
    echo -e " \033[0;32m --------------------------------- \033[0m "
    echo ""
else
    echo ""
    echo -e " \033[0;31m ------------------------------ \033[0m "
    echo -e " \033[0;31m Erro ao executar o Comando !!! \033[0m "
    echo -e " \033[0;31m ------------------------------ \033[0m "
    echo ""
fi