#!/bin/bash

#------------------------------------------------------------
#  Arquivo:       Verifica-status-list.sh
#  Descricao:     Verifica o status code de uma lista de urls
#  Autor:         Ricardo Fahham
#------------------------------------------------------------
clear
vermelho="\033[0;31m"
verde="\033[0;32m"

echo -e " $verde ----------------------- \033[0m"
echo -e " $verde Verificando STATUS CODE \033[0m"
echo -e " $verde ----------------------- \033[0m"

array=( ${array[@]} `cat lista.txt` )

for url in ${array[@]};
do
    codigo_http=$(curl --write-out %{http_code} --silent --output /dev/null $url)
    
    if [ $codigo_http -eq 200 ]; 
    then
        echo -e "$verde $(date +%F\ %T) - O site $url está respondendo, :-)"
        echo "$(date +%F\ %T) - O site $url está respondendo, :-)" >> logs/servidor.log
    else
        echo -e "$vermelho $(date +%F\ %T) - O site $url não está respondendo, :-("
        echo "$(date +%F\ %T) - O site $url não está respondendo, :-(" >> logs/servidor.log
    fi
done

# Fontes:
# https://www.alura.com.br/artigos/automatizando-tarefas-com-shell-script
# https://www.alura.com.br/artigos/automatizando-tarefas-com-shell-script