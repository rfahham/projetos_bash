#!/bin/bash

result=./logs/backlog_`date +%Y%m%d_%H%M%S`.txt

log= bash gera-infra.sh >> $result

echo "$log"


