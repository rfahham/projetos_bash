#!/bin/bash

# 8 - Corta ‘.com.br/’ do final da string

var="http://www.terminalroot.com.br/"
echo $var

echo ${var%.com.br/}