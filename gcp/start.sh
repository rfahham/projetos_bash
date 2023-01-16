#!/bin/bash

vermelho="\033[0;31m"
verde="\033[0;32m"

echo -e " \033[0;32m ------------------------------- \033[0m"
echo -e " \033[0;32m Iniciando Instâncias no GCP ... \033[0m"
echo -e " \033[0;32m ------------------------------- \033[0m"

# gcloud compute instances list

name=$(gcloud compute instances list | grep gce- | awk '{print $1}')

for i in $name
do
    gcloud compute instances start $i --zone=southamerica-east1-a
done

# gcloud compute instances list

echo -e " \033[0;32m ----------------------------- \033[0m"
echo -e " \033[0;32m Instâncias Paradas no GCP !!! \033[0m"
echo -e " \033[0;32m ----------------------------- \033[0m"