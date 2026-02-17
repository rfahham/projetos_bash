#!/bin/bash

# Instalar
# sudo apt install espeak    # Debian/Ubuntu
# sudo yum install espeak    # CentOS/RHEL

# Detecta sistema
OS=$(uname)

# Escolhe comando de fala
if [[ "$OS" == "Darwin" ]]; then
    VOICE_CMD="say"
elif command -v espeak &> /dev/null; then
    VOICE_CMD="espeak"
elif command -v spd-say &> /dev/null; then
    VOICE_CMD="spd-say"
else
    echo "Nenhum comando de síntese de voz disponível. Instale 'espeak' ou 'spd-say'."
    exit 1
fi

# Loop de 1 a 10
for NUM in {1..10}; do
    echo "Falando o número: $NUM"
    $VOICE_CMD "$NUM"
    sleep 0.5
done

echo "✅ Contagem finalizada!"
