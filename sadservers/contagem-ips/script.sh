#!/bin/bash

# busca no arquivo access.log o maior número de ips repetidos e envia o resultado para o arquivo result.txt

awk '{print $1}' access.log | sort | uniq -c | sort -r | head -1 | awk '{print $2}' > result.txt