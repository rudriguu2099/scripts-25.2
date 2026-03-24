#!/bin/bash

NUM=$1

case $NUM in 
    [0-9]|1[0-9]|20)
    case $NUM in
        0)
            echo "O valor é nulo."
            ;;
        10 | 20)
            echo "Valor especial"
            ;;
        *)
            echo "Valor é $NUM e não é especial."
            ;;
    esac
    ;;
    *)
        echo "invalido"
        ;;
esac
