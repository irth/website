#!/usr/bin/env bash
title() {
    head -n3 "$1" | tail -n 1 | sed -r 's/^\#+\s+//'
}

new() {
    cp template "posts/$1.gmi"
    nvim "posts/$1.gmi"
}

generate() {
    echo "# Wojciech ~irth Kwolek" > index.gmi
    echo "=> .. Back" >> index.gmi
    echo >> index.gmi
    echo "## Blog" >> index.gmi
    echo "" >> index.gmi

    for i in $(ls posts/*.gmi | sort -nr); do
        echo "=> $i  $(title "$i")" >> index.gmi
    done
}

"$@"

