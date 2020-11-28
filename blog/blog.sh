#!/usr/bin/env bash
title() {
    head -n1 "$1" | sed -r 's/^\#+\s+//'
}

date() {
    echo "$(basename "$1")" | cut -d_ -f1
}

new() {
    cp template "posts/$1.gmi"
    nvim "posts/$1.gmi"
}

generate() {
    echo "# Wojciech ~irth Kwolek's blag" > index.gmi
    echo "=> .. Back" >> index.gmi
    echo >> index.gmi

    for i in $(ls posts/*.gmi | sort -nr); do
        echo "=> $i $(date "$i")  $(title "$i")" >> index.gmi
    done

    echo "" >> index.gmi
    echo "This can be reached over gemini:// at the same path." >> index.gmi
}

"$@"

