#!/bin/bash

dns=$2
prefix=$1

echo "DNS resolution for $prefix"

for i in $(seq 1 254); do
 nslookup $prefix.$i $dns 2>&1   | grep "name = " 
done
