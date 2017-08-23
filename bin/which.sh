# which cmd: which cmd in '/bin' or '/usr/bin' is executed

opath=$PATH
PATH=/bin:/usr/bin

case $# in
    0)    echo "Usage: which command" 1>&2; exit 2
esac
for i in `echo $PATH | sed 's/:/ /g'`
do
    if [ -x $i/$1 ]    # this is /bin/test or /usr/bin/test only
    then 
	echo $i/$1
	exit 0
    fi
done
exit 1
