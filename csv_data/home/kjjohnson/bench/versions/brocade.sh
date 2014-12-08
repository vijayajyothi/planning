#!/bin/sh

cd /mnt/datadepot/LOGS/switch/supportshow
echo "vendor,switchname,version"
grep -m 1 '^Fabric OS:' *.txt | sed -e 's/-SUPPORTSHOW.txt:Fabric OS:\s*/,/' -e 's/^/brocade,/';
