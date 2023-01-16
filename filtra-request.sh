#!/bin/bash

if [ -z $1 ]
then
    while [ -z $requisicao]
    do
        read -p "parâmetro não informado !!!" requisicao
        letra_maiuscula=$(echo $requisicao | awk '{ print toupper($1) }')
    done
else
    letra_maiuscula=$(echo $1 | awk '{ print toupper($1) }')
fi

if [ $1 == "GET"]
then
    cat apache.log | grep GET
elif [ $1 == "POST"]
then
    cat apache.log | grep POST
elif [ $1 == "PUT"]
then
    cat apache.log | grep PUT
elif [ $1 == "DELETE"]
then
    cat apache.log | grep DELETE
fi

# ./filtra-request.sh <passar o methodo>

# -eq serve para comparar números inteiro

# == serve para comparar strings 

# Usando o CASE

letra_maiuscula=$(echo $1 | awk '{ print toupper($1) }')

case $1 in 
    GET)
    cat apache.log | grep GET
    ;;
    POST)
    cat apache.log | grep POST
    ;;
    PUT)
    cat apache.log | grep PUT
    ;;
    DELETE)
    cat apache.log | grep DELETE
    ;;
    *)
    echo "Parâmetor passado é inválido !!!"