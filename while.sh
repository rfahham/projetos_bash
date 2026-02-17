#!/bin/bash

# ==============================
# Configuração de cores
# ==============================
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
NC="\033[0m" # No Color

clear
echo -e "${GREEN}--------------------------------${NC}"
echo -e "${GREEN} Executando comando em loop     ${NC}"
echo -e "${GREEN}--------------------------------${NC}"

# ==============================
# Entrada do usuário
# ==============================
read -rp "Insira o comando a ser executado: " cmd
read -rp "Insira o intervalo em segundos: " tempo

# ==============================
# Validação do tempo
# ==============================
if ! [[ "$tempo" =~ ^[0-9]+$ ]]; then
    echo -e "${RED}Erro: o tempo deve ser um número inteiro.${NC}"
    exit 1
fi

# ==============================
# Testar se o comando existe
# ==============================
cmd_base=$(echo "$cmd" | awk '{print $1}')
if ! command -v "$cmd_base" >/dev/null 2>&1; then
    echo -e "${RED}Erro: comando inválido ou não encontrado.${NC}"
    exit 1
fi

# ==============================
# Tratamento de CTRL+C
# ==============================
trap 'echo -e "\n${YELLOW}Loop finalizado pelo usuário.${NC}"; exit 0' SIGINT

echo -e "${YELLOW}Iniciando execução a cada ${tempo}s... (CTRL+C para sair)${NC}"
echo

# ==============================
# Loop infinito
# ==============================
while true; do
    echo -e "${GREEN}[$(date '+%H:%M:%S')] Executando: ${cmd}${NC}"
    eval "$cmd"
    sleep "$tempo"
done
