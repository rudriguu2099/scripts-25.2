#!/bin/bash

arquivo_temp=""

clean(){
    echo "Tarefa Interrompida. Limpando..."
    [ -f "$arquivo_temp" ] && rm -f "$arquivo_temp"
    exit 1
}

trap clean SIGINT

exec_tarefa(){
    local name="$1"
    local time="$2"
    arquivo_temp="${name}.tmp"

    touch "$arquivo_temp"

    echo "Iniciando tarefa: $name (PID: $$)"
    sleep "$time"
    echo "Tarefa '$name' concluída com sucesso."

    rm -f "$arquivo_temp"

}

nome_tarefa=""
temp_exec=""

while getopts "n:t:" opt; do
    case $opt in
        n) nome_tarefa="$OPTARG" ;;
        t) tempo_exec="$OPTARG" ;;
        *) 
            echo "Uso: $0 -n <nome> -t <tempo (1-15)>" 
            exit 1
            ;;
    esac
done

exec_tarefa "$nome_tarefa" "$tempo_exec"
