#!/bin/bash

# NOTE: use ~/.pgpass for passwords
PGHOST="oacentral.vmware.com"
PGUSER="itinventory"
PGDATABASE="insight_v1_0"
PGPORT="50006"

OUTPUTDIR=csv

declare -A queries
queries[cim_chassis]='select * from cim_chassis'
queries[cim_networkadapter]='select * from cim_networkadapter'
queries[cim_physicalelement]='select * from cim_physicalelement'
queries[cim_powersupply]='select * from cim_powersupply'
queries[devices]='select * from devices'
queries[r_inventory]='select * from r_inventory'
queries[racks]='select r_racks.devicekey as devicekey,
		       assorack, assoenclosure,
		       enumlabel as devicetype,
		       slotnumber,
		       devicename,
		       model, serialnumber
		    from r_racks, nodetypesenum
		    where r_racks.type = nodetypesenum.enumord
		    order by assorack, assoenclosure, devicetype, slotnumber'
queries[r_networkinterface]='select * from r_networkinterface'

query() {
	key=$1
	echo "copy (${queries[$1]}) to stdout with csv header;"
}

mypsql() {
	psql -h "$PGHOST" -p "$PGPORT" "$PGDATABASE" "$PGUSER"
}

getcsv() {
	query "$1" | mypsql >"$OUTPUTDIR/$1.csv"
}

for key in ${!queries[@]}
do
	getcsv "$key"
done
