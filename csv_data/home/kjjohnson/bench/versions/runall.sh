#!/bin/sh

(echo "vendor,device,model,versiontype,version"

for F in arrays avamarclients brocade daes datadomaindisks datadomain disks spectrum hosts-esxinfo hosts sps vms f5
do
	echo $F >/dev/tty
	./$F.pl
done) >csv/all.csv
