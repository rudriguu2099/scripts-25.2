#!/bin/bash
tput clear


readonly BB=$(tput bold && tput setaf 4)
readonly RT=$(tput sgr0)

menu(){
    echo "${BB}Task manager! Iniciando...${RT}"
    echo "Selecione uma das opções abaixo:"
    echo "${BB}[1]${RT} Tempo ligado do sistema"
    echo "${BB}[2]${RT} As 10 últimas mensagens do Kerne"
    echo "${BB}[3]${RT} Estatísticas de memória virtual"
    echo "${BB}[4]${RT} Uso da CPU por núcleo "
    echo "${BB}[5]${RT} Uso da CPU por processo"
    echo "${BB}[6]${RT} Uso da memória física em MB"
    echo "${BB}[7]${RT} Sair"
}

while true
do
    tput clear
    menu
    read -r escolha

    return_message="Pressione ${BB}ENTER${RT} para voltar ao menu..."

    case $escolha in
        1)
            tput clear
            uptime
            read -n 1 -p "$return_message"
            ;;
        2)
            tput clear
            sudo dmesg | tail -n 10
            read -n 1 -p "$return_message" 
            ;;
        3)
            tput clear
            vmstat 1 10
            read -n 1 -p "$return_message"
            ;;
        4)
            tput clear
            mpstat -P ALL 1 5
            read -n 1 -p "$return_message" 
            ;;
        5)
            tput clear
            pidstat 1 5
            read -n 1 -p "$return_message" 
            ;;
        6)
            tput clear
            free -m 
            read -n 1 -p "$return_message"
            ;;
        7)
            tput clear
            exit
            read -n 1 -p "$return_message"
            ;;
        *)
            tput clear
            echo "Digite uma das opções do ${BB}MENU${RT}"
            sleep 1.5
            echo "Voltando ao ${BB}MENU${RT}"
            sleep 1.5
    esac
done