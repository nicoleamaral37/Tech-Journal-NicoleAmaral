for i in $(seq 2 50)
do
	nmap -sn 10.0.5.$i \
	| grep -oE '10\.0\.5\.[0-9]+'
done > sweep3.txt
