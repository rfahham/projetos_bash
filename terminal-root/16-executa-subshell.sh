#!/bin/bash

# 16 - ... (entre crases) Executa comandos numa subshell, retornando o resultado

# echo `ls -la`
echo " "

# 17 - Executa comandos numa subshell
(ls -lao)

echo "----------------------------------------------------------------"

# 18 - Executa comandos numa subshell, retornando o resultado

echo $(ls)

echo "----------------------------------------------------------------"