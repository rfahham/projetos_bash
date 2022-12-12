#!/bin/bash

# 13 - “” (aspas duplas) protege uma string, mas reconhece $, \ e ` como especiais

var="http://www.terminalroot.com.br/"
echo $var
echo "$var"

# 14 - ‘’ (aspas simples) protege uma string, mas reconhece $, \ e ` como especiais

echo '$var'

# 15 - $’…’ (cifrão antes de aspas simples) protege uma string completamente, mas interpreta \n, \t, \a, etc
echo $'$var\n'