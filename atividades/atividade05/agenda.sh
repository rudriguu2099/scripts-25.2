#!/bin/bash

COMAND=$1
DB="agenda.db"

case $COMAND in
    "adicionar")
        NAME=$2
        EMAIL=$3
        if [ ! -s "$DB" ]; then
            echo "Arquivo criado!!!"
        fi
        echo "$NAME:$EMAIL" >> $DB
        echo "Usuário $NAME adicionado."
        ;;
    "listar")
        if [ ! -e "$DB" ]; then
            echo "Arquivo não encontrado!!!"
        elif [ ! -s "$DB" ]; then
            echo "Arquivo vazio!!!"
        else
            cat "$DB"
        fi
        ;;
    "remover")
        EMAIL_TO_REMOVE=$2
        if [ ! -e "$DB" ]; then
            echo "Arquivo não encontrado!!!"
        else
            if grep -q "$EMAIL_TO_REMOVE" "$DB"; then
                LINE=$(grep "$EMAIL_TO_REMOVE" "$DB")
                NAME=$(echo "$LINE" | cut -d':' -f1)
                NEW_CONTENT=$(grep -v "$EMAIL_TO_REMOVE" "$DB")
                echo "$NEW_CONTENT" > "$DB"
                echo "Usuário "$NAME" removido."
            else
                echo "Usuário não encontrado"
            fi
        fi
        ;;
esac