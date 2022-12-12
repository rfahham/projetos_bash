#!/bin/bash

linha=1
linhas=$(gcloud compute instances list | wc -l )

gcloud compute instances list | awk '{print $1}' > name.txt
gcloud compute instances list | awk '{print $2}' > zona.txt

name=$(gcloud compute instances list | awk '{print $1}')
zone=$(gcloud compute instances list | awk '{print $2}')
# dic=( "gce-us-e1-grafana-k6-qa-prod" "gce-us-e1-influxdb-k6-qa-prod" "gce-us-e1-runner-k6-qa-prod" "gce-us-e1-workon-k6-qa-prod" "gce-k6-0-prod" )


# echo $linha
# echo $linhas
# # echo ${name[2]}
# # echo ${colum2[2]}
# echo ${dic[1]}

gcloud compute instances start ${name[0]} --zone=${zone[0]}

