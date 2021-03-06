#calendar: version 2 -- today and tomorrow
awk <./schedule.txt '
BEGIN {
    x = "Jan 31 Feb 28 Mar 31 Apr 30 May 31 Jun 30 " \
    	"Jul 31 Aug 31 Sep 30 Oct 31 Nov 30 Dec 31 Jan 31"
    split(x, data)
    for (i = 1; i < 24; i += 2)
    {
	days[data[i]] = data[i+1]
	nextmon[data[i]] = data[i+2]
    }
    split("'"`date`"'", date)
    mon1 = date[2]; day1 = date[3]
    mon2 = mon1; day2 = day1 + 1
    if (day2 >= days[mon1]) {
	day2 = 1
	mon2 = nextmon[nom1]
    }
}
$1 == mon1 && $2 == day1 || $1 == mon2 && $2 == day2
'
