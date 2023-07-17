#!/bin/bash

until ps -e | grep firefox > /dev/null
do
      echo "O navegador Firefox NÃO está em execução."
      sleep 10
done