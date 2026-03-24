#!/bin/bash

DIR=$1

for arq in "$DIR"/*
do
    wc -l "$arq"
done |sort -n | cut -d'/' -f2


