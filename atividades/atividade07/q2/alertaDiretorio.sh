#!/bin/bash

NUM_SLEEP=$1
DIRETORIO=$2
LOG="dirSensors.log"

INICIAL_STATE=$(ls -1 "$DIRETORIO" | sort)
QTD_ANTIGA=$(echo "$INICIAL_STATE" | wc -l)

while true; do
    sleep "$NUM_SLEEP"
    ACTUAL_STATE=$(ls -1 "$DIRETORIO" | sort)
    QTD_ATUAL=$(echo "$ACTUAL_STATE" | wc -l)

    if [ "$INICIAL_STATE" != "$ACTUAL_STATE" ]; then
        DATE=$(date +"[%d-%m-%Y %H:%M:%S]")

        readarray -t OLD <<< "$INICIAL_STATE"
        readarray -t NEW <<< "$ACTUAL_STATE"

        ADICIONADOS=""
        REMOVIDOS=""

        for f in "${OLD[@]}"; do
            if ! printf '%s\n' "${NEW[@]}" | grep -qx "$f"; then
                REMOVIDOS+="$f, "
            fi
        done

        for f in "${NEW[@]}"; do
            if ! printf '%s\n' "${OLD[@]}" | grep -qx "$f"; then
                ADICIONADOS+="$f, "
            fi
        done

        ADICIONADOS=${ADICIONADOS%, }
        REMOVIDOS=${REMOVIDOS%, }

        MSG="$DATE Alteração! $QTD_ANTIGA->$QTD_ATUAL."
        if [ -n "$ADICIONADOS" ]; then
            MSG="$MSG Adicionados: $ADICIONADOS"
        fi

        if [ -n "$REMOVIDOS" ]; then
            MSG="$MSG Removidos: $REMOVIDOS"
        fi


        echo "$MSG" | tee -a "$LOG"

        INICIAL_STATE="$ACTUAL_STATE"
        QTD_ANTIGA="$QTD_ATUAL"
    fi
done


# Para fazer a divisão de terminal, usar tmux.
# Digite tmux, depois ctrl+b + %
# Terminal da esquerda roda o script e o da direita roda as modificações no diretorioMonitorado
