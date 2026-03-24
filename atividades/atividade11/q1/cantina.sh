#!/bin/bash


nome=$(dialog --inputbox "Seu nome:" --stdout 0 0)

if [$? -ne 0] || [-z "$nome"]; then
    dialog --msgbox "Erro: Nome invalido ou cancelamento"
    clear
    exit 1
fi

lanche=$(dialog --stdout --menu "Escolha seu Lanche principal"  0 0 0 \
   "Hambúrguer" ""\
   "Pizza" ""\
   "Pastel" "")

if [$? -ne 0]; then
    dialog --msgbox "pedido cancelado" 0 0 
    clear
    exit 1
fi

adicionais=$(dialog --stdout --checklist "Adicionais:" 0 0 0 \
    "Refrigerante" "" off \
    "Suco" "" off \
    "Batata_Frita" "" off \
    "Molho_Extra" "" off)

if [$? -ne 0]; then
    dialog --msgbox "pedido cancelado" 0 0 
    clear
    exit 1
fi

dialog --stdout --yesno "Seu pedido está correto?" 0 0

if [$? -ne 0]; then
    dialog --msgbox "pedido cancelado" 0 0 
    clear
    exit 1
fi

dialog --title "Recibo:" --msgbox "Cliente: $nome\n
Prato: $lanche\n
Adicionais: $(echo $adicionais | sed 's/\"//g' | tr ' ' ',', )" 0 0

clear

exit 0