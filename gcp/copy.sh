#!/bin/bash

vermelho="\033[0;31m"
verde="\033[0;32m"

echo -e " \033[0;32m ------------------------------- \033[0m"
echo -e " \033[0;32m Copiando Instâncias no GCP ... \033[0m"
echo -e " \033[0;32m ------------------------------- \033[0m"

# copia um arquivo para as instâncias do GCP

ip=$(gcloud compute instances list | grep gce-k6 | awk '{print $4}')

for i in $ip
do
    ssh-keygen -R $i
    # scp ~/Documents/projetos_bash/monitor/monitor.sh ricardo_fahham_g_globo@$i:~
    # scp ~/Downloads/k6-v0.46.0-linux-amd64.tar.gz ricardo_fahham_g_globo@$i:~
    scp ~/Documents/projetos_bash/gcp/combate.js ricardo_fahham_g_globo@$i:~
done


# read -p "Insira seu login (ricardo_fahham): " login

# name=$(gcloud compute instances list | grep gce-k6 | awk '{print $4}')

# for i in $name
# do
#     "ssh" "ricardo_fahham_g_globo"@$i /bin/bash << EOF
#     sudo tar -C /usr/local -xzf k6-v0.46.0-linux-amd64.tar.gz
#     # sudo cp <nome do arquivo> /tmp/k6-performance-tests/qa3/reqs_auth
# EOF
# done

echo -e " \033[0;32m ----------------------------- \033[0m"
echo -e " \033[0;32m Arquivos copiados para GCP !!! \033[0m"
echo -e " \033[0;32m ----------------------------- \033[0m"