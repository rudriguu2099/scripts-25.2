BEGIN{
    print "Aluno:Situação:Média"
}

{
    media = ($2 + $3 + $4) / 3
    if (media >= 7){
        status = "Aprovado"
    } else if (media >= 5){
        status = "Final"
    } else {
        status = "Reprovado"
    }
    printf "%s:%s:%.1f\n", $1, status, media

    mt1 += $2
    mt2 += $3
    mt3 += $4
    total++
}

END {
    printf "Média das Provas: %.1f %.1f %.1f\n", mt1/total, mt2/total, mt3/total
}