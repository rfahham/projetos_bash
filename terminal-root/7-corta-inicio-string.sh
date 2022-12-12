#!/bin/bash

# 7 - Corta ‘http://’ do início da string

var="http://www.terminalroot.com.br/"
echo $var

echo ${var#http://}