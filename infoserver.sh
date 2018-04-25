
#!/bin/bash

####################################################################################
##                          INFORMAÇÕES SOBRE SERVIDOR                            ##
####################################################################################

#Titulo: 
#Versão:
#Autor:
#Data:

cpu_fisico=$(cat /proc/cpuinfo | grep "physical id" | sort | uniq | wc -l) 
numero_cores=$(cat /proc/cpuinfo | egrep "core id|physical id" | tr -d "\n" | sed s/physical/\\nphysical/g | grep -v ^$ | sort | uniq | wc -l)
cpu_cores=$(cat /proc/cpuinfo | egrep "core id|physical id")
memoria=$(free -g)


echo "CPUs físicos do servidor:" $cpu_fisico
echo "Cores do servidor:"        $numero_cores
echo "Proporção CPU x Cores:"    $cpu_cores
echo "Quantidade de memória:"    $memoria

# EOF