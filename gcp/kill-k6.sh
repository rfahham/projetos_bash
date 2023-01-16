#!/bin/bash

vermelho="\033[0;31m"
verde="\033[0;32m"

echo -e " \033[0;32m -------------------------- \033[0m"
echo -e " \033[0;32m Matando processo k6 no GCP \033[0m"
echo -e " \033[0;32m -------------------------- \033[0m"


read -p "Insira seu login (ricardo_fahham): " login

name=$(gcloud compute instances list | grep gce-k6 | awk '{print $4}')

for i in $name
do
    "ssh" $login"_g_globo"@$i /bin/bash << EOF
    sudo pkill k6
EOF
done

echo -e " \033[0;32m ----------------------------- \033[0m"
echo -e " \033[0;32m Processo k6 no GCP Finalizado \033[0m"
echo -e " \033[0;32m ----------------------------- \033[0m"