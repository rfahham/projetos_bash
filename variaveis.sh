#!/bin/bash
echo "-------------------"
echo "Meu primeiro script"
echo "-------------------"

message="Olá, Mundo!"
echo $message

echo "-------------------"
echo "Apagando uma variável"
echo "-------------------"

message="Olá, Mundo!"

unset message


echo "LOCAIS - Só é exibida dentro da função"
echo "GLOBAIS - É exibida fora da função"