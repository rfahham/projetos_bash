#!/bin/bash

# 9 - Substitui ‘terminalroot’ por ‘aurelio’, uma vez

var="http://www.terminalroot.com.br/"

echo "Antes: "
echo $var
echo " "
var=${var/terminalroot/aurelio} 
echo "Depois: "
echo $var
echo " "