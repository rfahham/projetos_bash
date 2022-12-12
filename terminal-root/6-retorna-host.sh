#!/bin/bash

# Retorna 8 caracteres a partir da posição 11

var="http://www.terminalroot.com.br/"
echo $var

echo ${var:11:8}

echo ${var:7:23}

# ping ${var:7:23}

curl -I $var