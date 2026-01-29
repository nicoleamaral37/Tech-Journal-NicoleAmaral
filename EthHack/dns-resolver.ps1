param ($prefix, $dns)

for ($i = 1; $i -le 254; $i++) {
    resolve-dnsname -dnsonly "$prefix.$i" -server $dns -erroraction ignore
}
