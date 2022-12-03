#!/bin/bash

lista=$(./gcloud compute instances list | awk '{print $1}')

for linha in $lista
do
./gcloud compute instances start $linha --zone=us-east1-b
done




./gcloud compute instances list | awk '{print $1}' | head -n3 | tail -1



lista=`./gcloud compute instances list | awk '{print $1}'`

for i in lista
do
	./gcloud compute instances stop $1 --zone=us-east1-b
done

gcloud compute instances list | awk '{print $1}' | head -n3 | tail -1



#!/bin/bash

linhas=$(gcloud compute instances list | wc -l)
colum1=$(gcloud compute instances list | awk '{print $1}')
colum2=$(gcloud compute instances list | awk '{print $2}')

while linha < linhas:
do
	gcloud compute instances start $colum1 --zone=$colum2
done
