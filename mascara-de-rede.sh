#/bin/bash
seperator=------------------------
seperator=$seperator$seperator
rows="%-5s| %.20s| %15d| %c\n"
TableWidth=60

printf "%.${TableWidth}s\n" "$seperator"
printf "%-5s| %-20s| %.15s| %s\n" CIDR MÁSCARA DE SUB-REDE N° DE ENDEREÇOS IP
printf "%.${TableWidth}s\n" "$seperator"
printf "$rows" "/28" 255.255.255.240 16
printf "$rows" "/27" 255.255.255.224 32
printf "$rows" "/26" 255 255 255 192 64
printf "$rows" "/25" 255.255.255.128 128
printf "%.${TableWidth}s\n" "$seperator"

