#!/bin/bash

hostfile=$1
portfile=$2

# referenced https://stackoverflow.com/questions/8968752/how-to-check-that-a-parameter-was-supplied-to-a-bash-script
if [ "$#" -ne 2 ]; then
    echo "Missing either a host or a port file".
	exit 1
fi

# referenced https://community.unix.com/t/file-size-greater-than-0/143565
if [ ! -s "$hostfile" ]; then
    echo "$hostfile is empty"
    exit 1
fi

if [ ! -s "$portfile" ]; then
    echo "$portfile is empty"
    exit 1
fi

echo "host,port"
for host in $(cat $hostfile); do
	for port in $(cat $portfile); do
		timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null  && echo "$host.$port"
	done
done	
