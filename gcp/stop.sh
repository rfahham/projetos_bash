#!/bin/bash

vermelho="\033[0;31m"
verde="\033[0;32m"

echo -e " \033[0;31m ----------------------------- \033[0m"
echo -e " \033[0;31m Parando Instâncias no GCP ... \033[0m"
echo -e " \033[0;31m ----------------------------- \033[0m"

name=$(gcloud compute instances list | grep gce- | awk '{print $1}')

for i in $name
do
    gcloud compute instances stop $i --zone=southamerica-east1-a
done

echo -e " \033[0;31m ----------------------------- \033[0m"
echo -e " \033[0;31m Instâncias Paradas no GCP !!! \033[0m"
echo -e " \033[0;31m ----------------------------- \033[0m"