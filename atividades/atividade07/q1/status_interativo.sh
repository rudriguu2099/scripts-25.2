#!/bin/bash

clear

TITULO="Relatório de Status"
VERSAO="1.0"

tput setaf 4
tput bold
echo $TITULO

tput cup 5 10
tput setaf 1
tput smul
echo $VERSAO

tput sgr0

tput cup 8 10
date

tput cup 10 10
whoami
