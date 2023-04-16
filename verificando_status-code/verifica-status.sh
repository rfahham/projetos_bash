#!/bin/bash

vermelho="\033[0;31m"
verde="\033[0;32m"

echo -e " \033[0;32m ----------------------- \033[0m"
echo -e " \033[0;32m verificando STATUS CODE \033[0m"
echo -e " \033[0;32m ----------------------- \033[0m"

clear

read -p "Insira o endereço para verificação: " url
codigo_http=$(curl --write-out %{http_code} --silent --output /dev/null $url)

if [ $codigo_http -eq 200 ]; 
then

    echo "-------------------------------------------------------"
    echo "$(date +%F\ %T) - O servidor $url está respondendo, :-)"
    echo "$(date +%F\ %T) - O servidor $url está respondendo, :-)" >> logs/servidor.log
    echo "-------------------------------------------------------"
    say Servidor $url está respondendo

else

    echo "------------------------------------------------------------"
    echo "$(date +%F\ %T) - O servidor $url não está respondendo, :-("
    echo "$(date +%F\ %T) - O servidor $url não está respondendo, :-(" >> logs/servidor.log
    echo "------------------------------------------------------------"
    say Servidor $url não está respondendo

fi


# https://www.alura.com.br/artigos/automatizando-tarefas-com-shell-script