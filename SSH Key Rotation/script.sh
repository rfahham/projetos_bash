#!/bin/bash
set -e

OLD_KEY="$HOME/.ssh/id_old"
NEW_KEY="$HOME/.ssh/id_ed25519_rotated"
AUTHORIZED="$HOME/.ssh/authorized_keys"

echo "🔐 Iniciando rotação de chave SSH..."

# Backup
cp "$AUTHORIZED" "${AUTHORIZED}.bak.$(date +%F-%T)"

# Gerar nova chave (ed25519)
ssh-keygen -t ed25519 -f "$NEW_KEY" -N ""

# Adicionar nova chave
cat "${NEW_KEY}.pub" >> "$AUTHORIZED"

echo "Nova chave adicionada ao authorized_keys."

# Remover chave antiga se existir
if [ -f "${OLD_KEY}.pub" ]; then
    grep -v -F -f "${OLD_KEY}.pub" "$AUTHORIZED" > "${AUTHORIZED}.tmp"
    mv "${AUTHORIZED}.tmp" "$AUTHORIZED"
    echo "Chave antiga removida."
fi

# Remover arquivos antigos com segurança
if [ -f "$OLD_KEY" ]; then
    rm -f "$OLD_KEY" "${OLD_KEY}.pub"
fi

chmod 600 "$AUTHORIZED"
chmod 700 "$HOME/.ssh"

echo "✅ Rotação concluída com sucesso."
