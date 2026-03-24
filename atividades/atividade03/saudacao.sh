#!/bin/bash

echo "Olá $(whoami),"
echo "Hoje é dia $(date +%d), do mês $(date +%m) do ano de $(date +%Y)."

echo "Olá $(whoami)," >> saudacao.log
echo "Hoje é dia $(date +%d), do mês $(date +%m) do ano de $(date +%Y)." >> saudacao.log