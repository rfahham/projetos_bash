#!/bin/bash

path=/Users/ricardo.fahham/Documents/projetos/projetos_bash/criando-backup

cd $path
if [ ! -d backup ]
then
    mkdir backup && ls -la
fi
