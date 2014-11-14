#!/bin/sh

export PGHOST="sc9-avamar1n1.vmware.com"
export PGPORT=5555
export PGDATABASE=mcdb
export PGUSER=viewuser
export PGPASSWORD="viewuser1"


# calculation to determine (now - 31_days)
now=$(date "+%s")
# 31 days ago
minusseconds=$((60 * 60 * 24 * 31))
monthago=$(($now - $minusseconds))
date=$(date -d "@$(($now - 2678400))" "+%F")

get_csv() {
	psql -c "copy ($1) to stdout with csv header;"
}

###############################################################################

get_csv 'select *
	from v_clients_2' >v_clients_2.csv

get_csv "select date_time,node,state,utilization,diskreadonly
	from v_node_util
	where date > '$date'
	order by date_time" >v_node_util.csv

get_csv "select date_time,node,disk,capacity_mb,used_mb,stripes_reserved_mb,stripes_used_mb,utilization,diskreadonly
	from v_node_space
	where date > '$date'
	order by date_time" >v_node_space.csv

get_csv "select *
	from v_dpn_stats
	where date > '$date'
	order by date_time" >v_dpn_stats.csv

###############################################################################
