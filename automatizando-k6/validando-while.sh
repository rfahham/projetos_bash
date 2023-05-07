#!/bin/bash

x=0

REPORT_URL="'https://report-api.apps.tsuru.gcp.i.globo/Testes_Periodicos_planilhas/'"

token="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7Il9pZCI6IjYwODVhNDU1MGUxYTgyZjdlMzI0Y2RlNSIsInNlbmhhIjoic2FsYWFtIiwiZW1haWwiOiJyaWNhcmRvLmZhaGhhbUBnLmdsb2JvIiwibmFtZSI6IlJpY2FyZG8gRmFoaGFtIn0sImlhdCI6MTY4MDIwMjEwNX0.HZDrdBFvWuPAJGbsRkajMXNrnuN83vure30CabWfr_s"

cenarios=("auth-time-info" "auth-time-salvar" "mercado-status" "auth-ligas" "auth-time" "cenario6" "cenario7")

while [ $x -lt 1 ]
do
    CENARIO=${cenarios[x]}
    
    echo "----------------------------------"
    echo "Executando" $CENARIO", aguarde..."
    echo "----------------------------------"

    k6 run -d30s -u10 "--summary-export=./result/"$CENARIO.json ./cenarios/$CENARIO.js

    echo "{" > ./tmp/report.json
    echo "\"name\": \"$CENARIO\"," >> ./tmp/report.json
    echo "\"projeto\": \"24_04_2023 - Teste_Automatizado_Cartola\"," >> ./tmp/report.json
    echo "\"baterias\": [{" >> ./tmp/report.json
    echo "\"DATA\": \"$(date +'%d/%m/%Y - %H:%M:%S') \"," >> ./tmp/report.json
    echo "\"REF\": \"\"," >> ./tmp/report.json
    echo "\"TAG\": \"""\"," >> ./tmp/report.json
    echo "\"Transações/seg (sucesso)\": \""$(cat ./result/$CENARIO.json | jq .metrics.http_reqs.rate)"\"," >> ./tmp/report.json
    echo "\"Transações (falhas)\": \""$(cat ./result/$CENARIO.json | jq .metrics.http_req_failed.value)"\"," >> ./tmp/report.json
    echo "\"Total de transações\": \""$(cat ./result/$CENARIO.json | jq .metrics.http_reqs.count)"\"," >> ./tmp/report.json
    echo "\"Tempo de resposta médio (ms)\": \""$(cat ./result/$CENARIO.json | jq .metrics.http_req_duration.avg)"\"," >> ./tmp/report.json
    echo "\"% Erros\": \"""\"," >> ./tmp/report.json
    echo "\"Duração(min)\": \"5\"," >> ./tmp/report.json
    echo "\"VUs\": \"\"," >> ./tmp/report.json
    echo "\"VU_max\":" \"$(cat ./result/$CENARIO.json | jq .metrics.vus_max.value)\", >> ./tmp/report.json
    echo "\"UNITS\": \"100\"," >> ./tmp/report.json
    echo "\"Configuração\": \"""\"," >> ./tmp/report.json	
    echo "\"Observação\": \"10 instâncias do TAAS, type: \"" >> ./tmp/report.json
    echo "}]," >> ./tmp/report.json
    echo "\"ferramenta\": \"K6\"" >> ./tmp/report.json
    echo "}" >> ./tmp/report.json
    
    # echo "" >> ./tmp/report.json Linha em branco

    echo "Enviando resultado para o Report"

    echo $token
    echo $REPORT_URL

    command="curl -X POST -H \"Content-Type: application/json\" -d '$(cat tmp/report.json)' -H \"authorization: $token\" $REPORT_URL"
    echo $command


    let "x = x +1"

    sleep 10
done