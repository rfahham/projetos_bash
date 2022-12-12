#!/bin/bash

# 11 - Se a string começar com ‘http’, substitui ‘http’ por ‘https’

var="http://www.terminalroot.com.br/"
echo " "
echo "Antes: "
echo $var
echo " "
var=${var/#http/https}
echo "Depois: "
echo $var
echo " "