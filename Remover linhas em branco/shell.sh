$ sed '/^$/d' arquivo.txt > novoarquivo.txt
ou
$ awk 'NF>0' arquivo.txt > novoarquivo.txt