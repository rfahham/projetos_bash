#!/bin/bash

CAMINHO_HOME=/Users/ricardo.fahham/Documents

cd $CAMINHO_HOME
if [ ! -d backup ]
then
    mkdir backup && ls -la
fi
