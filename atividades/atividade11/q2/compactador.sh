#!/bin/bash

error_function(){
if [ $? -ne 0 ]; then
    dialog --msgbox "Operação Cancelada\nEncerrando Programa..." 0 0 
    clear
    exit 1
fi
}

caminho=$(dialog --title "Caminho" --stdout --inputbox "Informe o Caminho para o diretorio" 0 0)

error_function

mapfile -t arquivos < <(ls "$caminho")

itens=()
for arq in "${arquivos[@]}"; do
    itens+=("$arq" "" off)
done

arquivos_escolher=$(dialog --title "Arquivos" --stdout --checklist "Escolha os arquivos para compactar" 0 0 0 \
"${itens[@]}")

error_function

zip=$(dialog --title "Tipo de Compactação" --stdout --menu "Escolha sua opção de compactação"  0 0 0 \
   "gzip" ""\
   "bzip2" "")

error_function

cd $caminho
if [ "$zip" = "bzip2" ]; then
    state=".tar.bz2"
    nomezip=$(dialog --title "Nome" --stdout --inputbox "Informe o nome do $state" 0 0)
    tar -cjf ../"$nomezip$state" $arquivos_escolher
    error_function

elif [ "$zip" = "gzip" ]; then
    state=".tar.gz"
    nomezip=$(dialog --title "Nome" --stdout --inputbox "Informe o nome do $state" 0 0)
    tar -czf ../"$nomezip$state" $arquivos_escolher
    error_function
fi

dialog --title "Parabéns!" --infobox "Os Arquivos foram compactados com sucesso no arquivo chamado $nomezip$state" 0 0 

