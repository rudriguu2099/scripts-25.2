#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Uso: $0 <diretorio>"
    exit 1
fi

DIR=$1

[ -d "$DIR" ] && [ -w "$DIR" ] && {
    echo "Diretório ok. Listando:"
    ls "$DIR"
} || {
    echo "Erro: O diretório não existe ou não pode ser modificado."
}