#!/bin/bash

range=$1
port=$2

# referenced https://stackoverflow.com/questions/8968752/how-to-check-that-a-parameter-was-supplied-to-a-bash-script
if [ "$#" -ne 2 ]; then
    echo "Missing either a host or a port".
        exit 1
fi

echo "host,port"
for host in $(seq 1 254); do
                timeout .1 bash -c "echo >/dev/tcp/$range.$host/$port" 2>/dev/null  && echo "$range.$host $port"
done    

