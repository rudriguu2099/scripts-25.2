#!/bin/bash

NOME="$1"
TIME=0
while true
do
    echo Processo: $NOME - Tempo: $TIME
    sleep 1
    TIME=$((TIME + 1))
done