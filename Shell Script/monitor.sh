#!/bin/bash

####################################################################################
## ARQUIVO GERENCIADO PELO PROJETO https://gitlab.globoi.com/time-infra-scrum/qa2 ##
## Last version: 26/04/2017                                                       ##
####################################################################################

result=/tmp/resultado_"$HOSTNAME"_`date +%Y%m%d_%H%M%S`.txt
avg=/tmp/media_"$HOSTNAME"_`date +%Y%m%d_%H%M%S`.txt
d_ini=$(date +%s)
t=0


header="tempo | cpu(%idle) | mem(%free) | load-avg | tcp"

i=0

echo -e $header

if [ $# -ne 2 ]
  then
  echo -e "Utlização correta: ./monitor.sh <tempo> <iteracao>\n"
  echo "       <tempo>  -  Tempo total da bateria. Valor em segundos."
  echo "    <iteracao>  -  Tempo de coleta das métricas. Valor em segundos."
  exit -1
fi

# virtual=$(facter|grep is_virtual|cut -d' ' -f3)
#redhat_release=$(rpm -q kernel | sed 's/.*\.\(el[0-9]\)\..*/\1/' | uniq)
version=$(cat /proc/version | egrep -o 'Red Hat|Ubuntu' | uniq)

#echo ${version}

if [ "${version}" == "Red Hat" ]; then
  release=$(rpm -q kernel | sed 's/.*\.\(el[0-9]\)\..*/\1/' | uniq)
elif [ "${version}" == "Ubuntu" ]; then
  release=$(uname -r | uniq)
else
  release="UNDEF"
fi

#echo ${release}

while [ $t -le $1 ]
do

  if [ $i -eq 20 ]
    then
    echo -e $header
    i=0
  fi

  vms=$(vmstat 1 2 | tail -n 1)
  if [ "${release}" == "el6" ]; then
    memory=$(free -m | grep 'buffers/cache:' | awk '{printf("%d\n", $4*100/($3+$4))}')
  elif [ "${release}" == "el7" ]; then
    memory=$(free -m | head -2 | tail -1 | awk '{printf("%d\n", $4*100/($3+$4))}')
  elif [ "${release}" == "3.13.0-107-generic" ]; then
    memory=$(free -m | grep 'buffers/cache:' | awk '{printf("%d\n", $4*100/($3+$4))}')
  else
    memory="UNDEF"
  fi
  loadavg=$(more /proc/loadavg | cut -d' ' -f1)
  procr=$(echo $vms | sed 's/ /-/g' | cut -f1 -d-)
  idlecpu=$(echo $vms | sed 's/ /-/g' | cut -f15 -d-)
  tcpinuse=$(cat /proc/net/sockstat |grep TCP:|cut -d' ' -f3)
  # if [ $virtual == 'false' ]; then
  #     tcpinuse=$(ss -s|grep TCP:|cut -d' ' -f6|cut -d, -f1)
  # else
  #     tcpinuse=$(cat /proc/net/sockstat |grep TCP:|cut -d' ' -f3)
  # fi
  timestamp=$(date +"%Y/%m/%d %T")

  echo "$timestamp,$idlecpu,$memory,$loadavg,$tcpinuse" >> $result
  echo -e "$timestamp\t$idlecpu\t$memory\t$loadavg\t$tcpinuse"
  let "i++"

  trap break SIGINT

  d_end=$(date +%s)
  t=$(expr $d_end - $d_ini)

  sleep $2
done

avg_cpu=$(cat $result | cut -d, -f2 | awk -v soma=0 '{ soma+=$1 }; END { printf ("%.2f\n", soma/NR) }')
avg_memoria=$(cat $result | cut -d, -f3 | awk -v soma=0 '{ soma+=$1 }; END { printf ("%.2f\n", soma/NR) }')
avg_load=$(cat $result | cut -d, -f4 | awk -v soma=0 '{ soma+=$1 }; END { printf ("%.2f\n", soma/NR) }')
avg_tcp=$(cat $result | cut -d, -f5 | awk -v soma=0 '{ soma+=$1 }; END { printf ("%d\n", soma/NR) }')

echo
echo
echo
echo "
Média de CPU (idle):       $avg_cpu %
Média de Memória (free):   $avg_memoria %
Média de loadavg:          $avg_load
Média de conexões TCP:     $avg_tcp"
echo
echo
echo "$result"
echo "$avg"
echo
echo -e "Copy/Paste:\n$avg_cpu\n$avg_memoria\n$avg_load\n$avg_tcp" |tee -a $avg
# EOF