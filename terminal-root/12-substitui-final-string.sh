#!/bin/bash

# 12 - Se a string terminar com ‘te’, substitui ‘te’ por ‘TADO’

var="teste"

echo "12 - Se a string terminar com ‘te’, substitui ‘te’ por ‘TADO’"
echo "Antes: "
echo $var
echo " "
var=${var/%te/TADO}
echo "Depois: "
echo $var
echo " "
