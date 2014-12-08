#!/bin/bash

COMMUNITY=outofcapacity

echo "it-capacity-win
10.16.182.4
10.20.146.236" | while read line
do
	echo "------------------------------------------------------------"
	echo  "-- Device: $line"
	echo "-- Nslookup:"
	nslookup $line 2>&1 | sed -e '/^Server:/d' -e '/^Address:.*#53$/d' -e '/^$/d' -e '/^Authoritative/d' -e '/^Non-authoritative/d' -e '/nameserver =/d' -e '/internet address =/d'
	echo "-- Ping:"
	ping -q -w 3 $line 2>&1 | grep 'packet loss'
	echo "-- Nmap:"
	sudo nmap -sU -p 161 $line 2>&1 | grep "^161"
	echo "-- SNMP:"
	snmpwalk -Os -v 2c -c "$COMMUNITY" $line system.sysDescr.0 2>&1
done
echo "------------------------------------------------------------"
