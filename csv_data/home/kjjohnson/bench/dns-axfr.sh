#/bin/sh

dnsserver="osdc-dns-1.vmware.com"
domain="vmware.com"

dig @"$dnsserver" "$domain" axfr
