#!/bin/bash

APP_NAME="teste"
VERSAO_ATUAL=$(sudo docker ps | grep teste | awk  '{print $2}' | cut -d: -f2)
VERSAO_NOVA=$(sudo docker ps| grep continue-watching-api-qa2- | head -n 1| awk  '{print $2}' | cut -d: -f2)

kill_container(){
    echo "Removendo a aplicação ${APP_NAME}..."
    sudo docker rm teste -f

}

start_container(){
    echo "Subindo o container de teste na versão ${VERSAO_NOVA}..."

}

update_container(){
    if [ "${VERSAO_ATUAL}" != "${VERSAO_NOVA}" ]
    then
        kill_container
        start_container
        exit 0
    elif [ -z "${VERSAO_ATUAL}"]
    then
        echo "O container com a versão atual não está rodando!"
        echo "Iniciando versão ${VERSAO_NOVA} "
        start_container
        exit 0
    else
        echo "A versão é a mesma."
        echo "Mantendo a versão atual."
    fi
}

update_container