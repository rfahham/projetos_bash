#!/bin/bash

# regex101.com

# regex="\b[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\b"
regex="\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"

if [[ $1 =~ $regex ]]
then
    cat lista.txt | grep $1
else
    echo "Formato não é válido"
fi