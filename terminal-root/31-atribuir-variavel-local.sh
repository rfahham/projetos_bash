#!/bin/bash

# 31 - Para atribuir um valor a uma variável local

LINUX=free
echo $LINUX


# 32 - verificar se a variável criada no item anterior aparece na relação de variáveis locais

set | grep LINUX
LINUX=free 

# 33 - Agora vamos tornar esta variável local em uma variável global

export LINUX
env | grep LINUX
LINUX=free

# 34 - Deletar uma ‘variável de ambiente local’ da memória usamos o comando unset

unset LINUX
echo $LINUX

