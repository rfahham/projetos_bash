#!/bin/bash

echo ""
echo "Usando tr"
echo "Converter String para letras minúsculas" | tr '[:upper:]' '[:lower:]'
echo ""

echo "Usando AWK"
echo "Converter String para letras minúsculas" | awk '{print tolower($0)}'
echo ""
