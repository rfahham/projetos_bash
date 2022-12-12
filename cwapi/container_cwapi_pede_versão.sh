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
    if [ "${VERSION}" != "${VERSAO_ATUAL}" ]
    then
        echo "Subindo versão ${VERSION}..."
        sudo docker run -p 8888:8888 -d --name ${APP_NAME} \
        -e DBAAS_REDIS_HOST="continuewa-01-160130023411.sentinel.globoi.com, continuewa-02-160130023411.sentinel.globoi.com, continuewa-03-160130023411.sentinel.globoi.com" \
        -e DBAAS_REDIS_POOL_SIZE="5000" \
        -e GLIVE_HOST="https://glive.backstage.globoi.com" \
        -e BACKSTAGE_CLIENT_SECRET="GLSXbrIjaGCFEJezflEWsQ==" \
        -e BACKSTAGE_HOST="https://accounts.backstage.globoi.com/token" \
        -e DBAAS_REDIS_IS_CLUSTER="false" \
        -e DBAAS_REDIS_PASSWORD="qu7uNTucnd" \
        -e DBAAS_REDIS_PORT=26379 \
        -e DBAAS_REDIS_SENTINEL_MASTER_NAME=continuewa160130023411 \
        -e CONSUMER_STREAM_TO_MEMORY_COUNT="0" \
        -e CONSUMER_STREAM_TO_MEMORY_WORKERS_COUNT="4" \
        -e CONSUMER_STREAM_TO_GARBAGE_WORKERS_COUNT="0" \
        -e GLOBOID_KEY_PATH="globoid.rsa.pub" \
        -e CONSUMER_STREAM_TO_MEMORY_GROUP="buffer_group" \
        -e CONSUMER_STREAM_TO_DB_WORKERS_COUNT="0" \
        -e GLIVE_USER_DEFAULT="0447c475-6d75-42a2-b032-c27e1d5f6790" \
        -e BACKSTAGE_CLIENT_ID="IshiEx0EMh1oop1GuPZyng==" \
        docker-tsuru.artifactory.globoi.com/tsuru/app-continue-watching-api-qa2:${VERSION} /bin/sh -lc "[ -d /home/application/current ] && cd /home/application/current; exec ./continue-watching-api api"
        exit 0
    else
        echo "Versão não informada"
    exit 1
    fi
}

check_version
kill_container
run_container
