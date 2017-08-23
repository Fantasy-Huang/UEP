# cal: nicer interface to /usr/bin/cal

case $# in
    0)   set `date`; m=$2; y=$6 ;; # no args: use today
    1)   m=$1; set `date`; y=$6 ;; # 1 args: use this year
    2)   m=$1; y=$2 ;; # 2 args: month and year
esac

case $m in
    [jJ]an*)    m=1 ;;
    [fF]eb*)    m=2 ;;
    [mM]ar*)    m=3 ;;
    [aA]pr*)    m=4 ;;
    [mM]ay*)    m=5 ;;
    [jJ]un*)    m=6 ;;
    [jJ]ul*)    m=7 ;;
    [aA]ug*)    m=8 ;;
    [sS]ep*)    m=9 ;;
    [oO]ct*)    m=10 ;;
    [nN]ov*)    m=11 ;;
    [dD]ec*)    m=12 ;;
    [1-9]|10|11|12)    ;; # numeric month
    *)    y=$m; m="" ;;   # plain year
esac

`which cal` $m $y    # run the real one
