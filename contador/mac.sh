#!/bin/bash

# Verifica se comando 'say' está disponível
if ! command -v say &> /dev/null; then
    echo "Erro: comando 'say' não encontrado. Este script funciona apenas no macOS."
    exit 1
fi

# Loop de 1 a 10
for CONTADOR in {1..10}; do
    echo "Falando o número: $CONTADOR"
    say "$CONTADOR"
    sleep 0.5  # pausa para não falar muito rápido
done

echo "✅ Contagem finalizada!"
