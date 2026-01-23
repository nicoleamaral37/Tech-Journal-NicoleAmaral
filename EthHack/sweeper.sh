for i in $(seq 2 50)
do
	ping -w 1 -c 1 10.0.5.$i \
	 | grep "64 bytes from" \
	 |grep -oE '10\.0\.5\.[0-9]+'

done > sweep.txt
