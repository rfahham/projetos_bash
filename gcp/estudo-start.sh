#!/bin/bash

linha=1
linhas=$(gcloud compute instances list | wc -l )

gcloud compute instances list | awk '{print $1}' > name.txt
gcloud compute instances list | awk '{print $2}' > zona.txt

name=$(gcloud compute instances list | awk '{print $1}')
zone=$(gcloud compute instances list | awk '{print $2}')

# echo $linha
# echo $linhas
# # echo ${name[2]}
# # echo ${colum2[2]}
# echo ${dic[1]}

gcloud compute instances start ${name[0]} --zone=${zone[0]}

