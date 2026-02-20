param(
    [string]$Name,
    [string]$IPv4
)

Import-Module DnsServer

$Zone = "nicole.local"
$PtrZone = "5.0.10.in-addr.arpa"
$LastOctet = $IPv4.split(".")[-1]
$PtrName = "$Name.$Zone."

Add-DnsServerResourceRecordA `
    -ZoneName $Zone `
    -Name $LastOctet `
    -IPv4Address $IPv4

write-host $LastOctet.$PtrName

Add-DnsServerResourceRecordPtr `
    -ZoneName $zone `
    -Name $Name `
    -PtrDomainName 