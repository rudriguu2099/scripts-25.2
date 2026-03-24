#!/bin/bash

FILE=$1
cat $FILE | while read IP
do 
    TIME=$(ping -c 10 $IP | grep "rtt" | cut -d '/' -f 5)
    echo $IP $TIME"ms"
done | sort -n -k2

