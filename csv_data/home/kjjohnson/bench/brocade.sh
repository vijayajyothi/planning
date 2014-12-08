#!/bin/bash

switches=( monitor@10.113.16.40 kevinj@paix-fab2-sw1.vmware.com )

commandstr=''

# cannot run firmwareshow - PATH not set correctly and rbash has PATH readonly
for C in version 'bladevershow all' cfgshow chassisname chassisshow fabricshow ipaddrshow islshow 'memshow -k' psshow 'slotshow -m' switchshow 'wwn -sn'
do
	commandstr="$commandstr echo '---[ $C ]---'; $C;"
	# ssh monitor@10.113.16.40 "$C" >"brocade/$C.txt"
done

for swtch in $(seq 0 $((${#switches[@]} - 1)))
do
	(ssh ${switches[$swtch]} "$commandstr") >"brocade/brocade-${swtch}.txt"
done

# echo "10.113.16.40"
# (ssh monitor@10.113.16.40 "$commandstr") >"brocade/brocade-1.txt"
# echo "paix-fab2-sw1.vmware.com"
# (ssh kevinj@paix-fab2-sw1.vmware.com "$commandstr") >"brocade/brocade-2.txt"
