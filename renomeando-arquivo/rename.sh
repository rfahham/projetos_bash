#!/bin/bash
path='/Users/ricardo.fahham/Documents/projetos/projetos_bash/renomeando-arquivo'
echo $path

ls -la $path
# mv $path/arquivo.csv $path/arquivo.txt
# mv $path/arquivo.txt $path/arquivo.csv

# mv $path/$1.csv $path/$1.txt

# mv $path/$1.txt $path/$1.csv

for i in $@ 
do
    # mv $path/$i.csv $path/$i.txt
    mv $path/$i.txt $path/$i.csv
    echo "Arquivo alterado"
done

### EXECUTAR: 
    # bash rename.sh arquivo

### OBS:
    # $@ significa, todos os parametros passados pelo usuário pela linha de comando

