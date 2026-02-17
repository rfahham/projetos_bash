#!/bin/bash

# substitui o http por https

# echo "$(sed 's/http/http/g' hosts.txt)" > hosts.txt

# ou 

# sed -i 's/http/https/g' hosts.txt



# Arquivo de entrada
INPUT="hosts.txt"

# Arquivo de saída (pode sobrescrever o original se quiser)
OUTPUT="hosts_https.txt"

# Verifica se o arquivo existe
if [ ! -f "$INPUT" ]; then
    echo "Arquivo $INPUT não encontrado!"
    exit 1
fi

# Substitui http:// por https:// e salva no arquivo de saída
sed 's|^http://|https://|' "$INPUT" > "$OUTPUT"

echo "✅ Conversão concluída! Arquivo salvo como $OUTPUT"
