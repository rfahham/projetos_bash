#!/bin/bash

APP_NAME="teste"
VERSAO_ATUAL=$(sudo docker ps | grep teste | awk  '{print $2}' | cut -d: -f2)
VERSION=$1

check_version(){
    if [ -z "${VERSION}" ]
    then
        echo "Necessário especificar a nova versão!"
        echo "A Versão atual do container de teste é: ${VERSAO_ATUAL}"
        exit 1
    fi
}
kill_container(){
    echo "Removendo a aplicação ${APP_NAME}..."
    sudo docker rm teste -f

}   # end of system_info



run_container(){
    echo "Subindo o container de ${APP_NAME}..."
}

check_version
kill_container
run_container
