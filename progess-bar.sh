# https://rextester.com/JAGD20301

#!/bin/bash

# Declarei um array simulando o total de steps.
# O "-r" é pra dizer que é uma variável apenas de leitura (read)
declare -r STEPS=('step1' 'step2' 'step3' 'step4')
# Calcula o length (tamanho) do array
declare -r MAX_STEPS=${#STEPS[@]}
# Tamanho máximo da barra quando estiver em 100%
declare -r BAR_SIZE="##########"
# Calcula o length (tamanho) da string
declare -r MAX_BAR_SIZE=${#BAR_SIZE}

# Esconde o cursor
tput civis -- invisible

# Faço um for loop..
for step in "${!STEPS[@]}"; do
  # Calcula a porcentagem do loop corrente
  perc=$(((step + 1) * 100 / MAX_STEPS))
  # Calcula o último caracteres da barra baseado na porcentagem
  percBar=$((perc * MAX_BAR_SIZE / 100))

  # Simalando um comando rodando...
  sleep 1

  # Exibo a porcentagem do loop corrente
  # Flag -n para manter o ponteiro na mesma linha
  # Flag -e para voltar o ponteiro no inicio da linha
  echo -ne "\\r[${BAR_SIZE:0:percBar}] $perc %"
done
echo ""

# Volta cursor ao normal
tput cnorm -- normal