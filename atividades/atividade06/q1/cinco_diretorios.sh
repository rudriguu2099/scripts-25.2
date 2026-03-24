#!/bin/bash

mkdir cinco
cd cinco/

for i in {1..5}
do
mkdir "dir$i"
cd "dir$i"
    for j in {1..4}
    do
        touch "arq$j.txt"
        for k in $(seq 1 $j)
        do
            echo $j >> "arq$j.txt"
        done
    done
cd ..
done

