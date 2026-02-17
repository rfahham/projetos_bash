#!/bin/bash

# Precisa instalar o net-tools para usar o ifconfig
# IP="$( /sbin/ifconfig -a | grep broadcast | sed 's/netmask.*//g; s/[^0-9.]//g')"
# echo O seu IP é ${IP}

# IP=$(ip -4 addr show | grep inet | awk '{print $2}' | cut -d/ -f1)
# echo "Loopback: ${IP}"

# IP=$(ip route get 1 | awk '{print $7; exit}')
# echo "IP "real" da internet: ${IP}"

# curl ifconfig.me

# Loopback
LOOPBACK=$(ip -4 addr show lo | awk '/inet / {print $2}' | cut -d/ -f1)

# IP usado para sair para internet (rota padrão)
IP_REAL=$(ip route get 1 | awk '{print $7; exit}')

# Todos IPs IPv4 privados (exceto loopback)
IPS_PRIVADOS=$(ip -4 addr show | awk '/inet / && $2 !~ /^127/ {print $2}' | cut -d/ -f1)

# IP público
IP_PUBLICO=$(curl -s ifconfig.me)

echo "==============================="
echo "Informações de Rede"
echo "==============================="
echo "Loopback: ${LOOPBACK}"
echo "IP \"real\" da internet (interface padrão): ${IP_REAL}"
echo
echo "IPs privados ativos:"
echo "${IPS_PRIVADOS}"
echo
echo "IP público: ${IP_PUBLICO}"
echo "==============================="
