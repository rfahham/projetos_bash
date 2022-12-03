#!/bin/bash

read -p "Entre com o ano do seu nascimento: " data
printf "%2d\n" $(date - d "-$(date +$data) year" +%Y)