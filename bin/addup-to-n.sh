awk '
BEGIN { n = '$1' }
{	for (i = 1; i <= n; i++)
		sum[i] += $i
}
END {
	for(i = 1; i <= n; i++) {
		printf "%6g ", sum[i]
		total += sum[i]
	}
	printf "; total = %6g\n", total
}'
