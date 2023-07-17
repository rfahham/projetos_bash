#!/bin/bash

path="infra/terraform/gcp/gglobo-k6-qa-hdg-prd/terraform.tfvars"
name=$(gcloud compute instances list | grep gce-k6- | awk '{print $1}')
ip=$(gcloud compute instances list | grep gce-k6- | awk '{print $4}')
amount=$(cat $path | head -n 1 | awk '{print $3}')

echo "NUMBER_INSTANCES ATUAL: " $amount
read -p "Insira o novo NUMBER_INSTANCES: " new_amount

for i in $ip
do
    ssh-keygen -R $i
done

sleep 60

for i in $name
do
    gcloud compute instances stop $i --zone=southamerica-east1-a
done

sleep 60

sed -i '' "s/$amount/\"$new_amount\"/g" $path

make create

sleep 60

for i in $name
do
    gcloud compute instances start $i --zone=southamerica-east1-a
done

sleep 60

if [ $amount < $new_amount ]
    then
        make setup
fi