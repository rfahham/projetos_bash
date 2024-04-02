#!/bin/bash

while true
do
  curl -ILs $1 | grep "HTTP/"
  sleep $2
done
