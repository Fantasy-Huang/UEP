#!/bin/sh

awk '
FILENAME != prevfile { # new file
    NR = 1            # reset line number
    prevfile = FILENAME
}
NF > 0 {
    if ($1 == lastword)
        printf "double %s, file %s, line %d\n", $1, FILENAME, NR
    for (i = 2; i <= NF; i++)
        if ($i == $(i-1))
            printf "double %s, file %s, line %d\n", $i, FILENAME, NR
    if (NF > 0)
        lastword = $NF
}' $*
