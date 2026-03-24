#!/bin/bash

read -p "Informe o arquivo: " arquivo

cat "$arquivo" | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]' | tr ' ' '\n' | sort | uniq -c | sort -nr |
while read qtd palavra; do
    echo "$palavra: $qtd"
done
