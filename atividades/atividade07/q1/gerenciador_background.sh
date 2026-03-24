#!/bin/bash

read -p "Informe o nome do processo:" NOME

./contador.sh $NOME &

PID=$!

echo $PID
sleep 10
kill $PID
echo Processo $NOME finalizado PID: $PID 