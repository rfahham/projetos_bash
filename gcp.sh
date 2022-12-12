#!/bin/bash

# name=$(gcloud compute instances list | grep gce | awk '{print $1}')

# zone=$(gcloud compute instances list | grep e2 | awk '{print $3}')

# echo "----------"
# echo $name
# echo "----------"
# echo $zone
# echo "----------"

# for linha in $lista
# do
# 	gcloud compute instances start $name --zone=$zone
# done

# while :
# do
# 	echo Ricardo Fahham
# done

# Lista a coluna toda
# gcloud compute instances list | awk '{print $1}'





!/bin/bash

linhas=$(gcloud compute instances list | wc -l )
colum1=$(gcloud compute instances list | grep gce |awk '{print $1}')
colum2=$(gcloud compute instances list | grep e2 |awk '{print $3}')


while linha < linhas:
do
	gcloud compute instances start $colum1 --zone=$colum2
done
