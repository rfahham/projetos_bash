#!/bin/bash

vermelho="\033[0;31m"
verde="\033[0;32m"

clear 

echo -e " \033[0;32m --------------------------- \033[0m"
echo -e " \033[0;32m Listando Instâncias no GCP \033[0m"
echo -e " \033[0;32m --------------------------- \033[0m"

./gcloud compute instances list && echo "---------------------------------------------------------------------------------------------------------------------------------------" && ./gcloud compute instances stop gce-us-e1-grafana-k6-qa-dev --zone=us-east1-b && ./gcloud compute instances stop gce-us-e1-healthcheck-k6-qa --zone=us-east1-b && ./gcloud compute instances stop gce-us-e1-poc-grafana-k6-qa-prod --zone=us-east1-b && ./gcloud compute instances stop gce-us-e1-prometheus-k6-qa-dev --zone=us-east1-b && ./gcloud compute instances stop performance-testing --zone=us-east1-b && echo "---------------------------------------------------------------------------------------------------------------------------------------" && ./gcloud compute instances list

echo -e " \033[0;31m --------------------------- \033[0m"
echo -e " \033[0;31m Instâncias stopadas no GCP \033[0m"
echo -e " \033[0;31m --------------------------- \033[0m"

