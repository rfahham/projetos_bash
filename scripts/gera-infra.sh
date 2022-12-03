
#!/bin/bash

TOKEN="$(cat ../.git-token)"

# Tsuru app info
tsuru app info -a cartola-api-qa02 > app-info.tsuru

# Tsuru app env
tsuru app run env -o -i -a cartola-api-qa02 > app-env.tsuru

# Tsuru app version
tsuru app run cat version.txt -o -i -a cartola-api-qa02 > app-version.tsuru

VERSION=$(cat app-version.tsuru | grep Tag: | cut -d' ' -f2)
COMMIT=$(cat app-version.tsuru | grep Commit: | cut -d' ' -f2)

# Version & commit
echo
echo '## Versao/Commit da app "cartola-api-qa02" ##'
echo "Version: ${VERSION}"
echo "Commit: ${COMMIT}"
echo

# App 
POOL=$(cat app-info.tsuru | grep 'Pool:')
ADDR=$(cat app-info.tsuru| grep 'Address:')
VMS=$(cat app-info.tsuru | grep 'started' | cut -d' ' -f6)

echo "## Tsuru App info ##"
echo "${POOL}"
echo "${ADDR}"
echo "Hosts:"
for VM in ${VMS}; do
    echo "  - ${VM}"
done

# MySQL - dbaas
DBAAS_MYSQL_HOSTS=$(cat app-env.tsuru | grep 'DBAAS_MYSQL_HOSTS=' | cut -d= -f2)
echo
echo "## MySQL (dbaas) ##"
echo "Hosts:"
for VM in ${DBAAS_MYSQL_HOSTS}; do
    echo "  - ${VM}"
done

# Redis - dbaas
DBAAS_REDIS_HOST=$(cat app-env.tsuru | grep 'DBAAS_REDIS_HOST=' | cut -d= -f2 | sed 's/,/&\'$'\n/g' | cut -d, -f1)
DBAAS_SENTINEL_HOSTS=$(cat app-env.tsuru | grep 'DBAAS_SENTINEL_HOSTS=' | cut -d= -f2 | sed 's/,/&\'$'\n/g' | cut -d, -f1)
echo
echo "## Redis Cluster ##"
echo "Hosts:"
for VM in ${DBAAS_REDIS_HOST}; do
    echo "  - ${VM}"
done
echo
echo "## Redis Sentinel ##"
echo "Hosts:"
for VM in ${DBAAS_SENTINEL_HOSTS}; do
    echo "  - ${VM}"
done

# Redis - fisico
curl -s --request GET --header "PRIVATE-TOKEN: ${TOKEN}" "https://gitlab.globoi.com/api/v4/projects/1977/repository/files/deploy%2Fqa02%2Fsettings_qa02%2Ejson/raw?ref=${VERSION}" > app-servicos.tsuru
REDIS_HOSTS=$(cat app-servicos.tsuru | grep '10.224.208.8' | cut -d, -f1 | sed 's,",,g')
echo
echo "## Redis (farm) ##"
if [ -z "${TOKEN}" ]; then
    echo "Token is empty!!!"
else
    echo "Hosts:"
    for VM in ${REDIS_HOSTS}; do
        echo "  - ${VM}"
    done
fi

# MySQL - fisico
DATABASE_HOST_WRITE=$(cat app-env.tsuru | grep 'DATABASE_HOST_WRITE=' | cut -d= -f2)
DATABASE_HOST_READ=$(cat app-env.tsuru | grep 'DATABASE_HOST_READ=' | cut -d= -f2)
echo
echo "## MySQL - write ##"
echo "Hosts:"
for VM in ${DATABASE_HOST_WRITE}; do
    echo "  - ${VM}"
done
echo
echo "## MySQL - read ##"
echo "Hosts:"
for VM in ${DATABASE_HOST_READ}; do
    echo "  - ${VM}"
done

# Outras dependencias
echo 
echo "## Dependencias - libs ##"
if [ -z "${TOKEN}" ]; then
    echo "Token is empty!!!"
else
    echo Arquivo "dep.tsuru" gerado com sucesso!
    curl -s --request GET --header "PRIVATE-TOKEN: ${TOKEN}" "https://gitlab.globoi.com/api/v4/projects/1977/repository/files/Gopkg%2Etoml/raw?ref=${VERSION}" > go-dep.txt
    echo
fi


###############

if [ -f app-info.tsuru -a -f app-env.tsuru ]; then
    rm ./*.tsuru
fi
