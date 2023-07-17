#!/bin/bash

vermelho="\033[0;31m"
verde="\033[0;32m"
azul="\033[0;34m"
path="infra/terraform/gcp/gglobo-k6-qa-hdg-prd/terraform.tfvars"

name=$(gcloud compute instances list | grep gce- | awk '{print $1}')
machine_type=$(gcloud compute instances list | tail -n 1 | awk '{print $3}')

echo -e "$azul --------------------------------------- \033[0m"
echo -e "$azul MACHINE_TYPE ATUAL:\033[0m" $machine_type 
read -p "Insira o novo MACHINE_TYPE: " new_machine_type
echo -e "$azul --------------------------------------- \033[0m"
echo ""
echo ""
echo -e "$vermelho ----------------------------- \033[0m"
echo -e "$vermelho Parando Instâncias ...        \033[0m"
echo -e "$vermelho ----------------------------- \033[0m"

# for i in $name
# do
#     gcloud compute instances stop $i --zone=southamerica-east1-a
# done

echo -e "$vermelho ----------------------------- \033[0m"
echo -e "$vermelho Instâncias paradas ...        \033[0m"
echo -e "$vermelho ----------------------------- \033[0m"

echo ""
echo -e " \033[0;35m ALTERANDO ARQUIVO DE CONFIGURAÇÃO... \033[0m"
sed -i '' "s/$machine_type/$new_machine_type/g" $path
make create
echo ""

echo -e "$verde ----------------------------- \033[0m"
echo -e "$verde Ligando Instâncias  ...        \033[0m"
echo -e "$verde ----------------------------- \033[0m"

# for i in $name
# do
#     gcloud compute instances start $i --zone=southamerica-east1-a
# done

echo -e "$verde ----------------------------- \033[0m"
echo -e "$verde Instâncias Ligadas !!!        \033[0m"
echo -e "$verde ----------------------------- \033[0m"

new_machine_type=$(gcloud compute instances list | tail -n 1 | awk '{print $3}')
echo -e "$azul O MACHINE_TYPE ATUAL: \033[0m"$new_machine_type 
