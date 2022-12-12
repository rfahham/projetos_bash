#!/bin/bash

# 10 - Substitui ‘o’ por ‘O’, sempre

var="http://www.terminalroot.com.br/"
echo " "
echo "Antes: "
echo $var
echo " "
var=${var//o/O}
echo "Depois: "
echo $var
echo " "