#!/usr/bin/env bash
title() {
    head -n1 "$1" | sed -r 's/^\#+\s+//'
}

postdate() {
    echo "$(basename "$1")" | cut -d_ -f1
}

new() {
    path="posts/$(date -Idate)_$1.gmi"
    cp template "$path"
    nvim "$path"
}

generate() {
    echo "# Wojciech ~irth Kwolek's blag" > index.gmi
    echo "=> .. Back" >> index.gmi
    echo >> index.gmi

    for i in $(ls posts/*.gmi | sort -nr); do
        echo "=> $i $(postdate "$i")  $(title "$i")" >> index.gmi
    done

    echo "" >> index.gmi
    echo "This can be reached over gemini:// at the same path." >> index.gmi
}

"$@"

