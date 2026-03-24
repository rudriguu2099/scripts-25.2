#!/bin/bash

readonly db="hosts.db"

HOSTNAME=""
IP=""

adicionar(){
    echo "$HOSTNAME $IP" >> $db
}

remover(){
    sed -i "/^$HOSTNAME /d" "$db"
}

listar(){
    cat $db
}

procurar_padrao(){
    awk -v hostname="$HOSTNAME" '$1 == hostname {print $2}' "$db"
}

procurar_reversa(){
    awk -v ip="$IP" '$2 == ip { print $1 }' "$db"
}


while getopts ":a:i:d:r:l" opt; do
    case $opt in 
        a)
            HOSTNAME="$OPTARG"
            ;;
        i)
            IP="$OPTARG"
            adicionar
            exit
            ;;
        d)
            HOSTNAME="$OPTARG"
            remover
            exit
            ;;
        
        r)
            IP="$OPTARG"
            procurar_reversa
            exit
            ;;
        
        l)
            listar
            exit
            ;;
    esac
done
HOSTNAME="$1"
procurar_padrao "$HOSTNAME"