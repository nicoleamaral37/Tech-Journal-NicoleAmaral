for i in $(seq 2 50)
do
	fping -c 1  -a  10.0.5.$i 2>&1 \
	 | grep "1/1/0%" | grep -oE '10\.0\.5\.[0-9]+'
done > sweep2.txt

