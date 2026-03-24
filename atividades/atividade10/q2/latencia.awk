{
    lat[$1] = $2
}

END {
    comando = "sort -k2n"

    for (ip in lat){
        printf "%s %sms\n", ip, lat[ip] | comando
    }

    close(comando)
}