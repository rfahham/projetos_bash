# define o interpretador que será utilizado
#!/bin/bash

vermelho="\033[0;31m"
verde="\033[0;32m"

# define qual arquivo será usado para ler a lista de URLs
URL_LIST="urls.txt"

cat urls.txt

readarray URLS < ${URL_LIST}
