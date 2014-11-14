###############################################################################
# Gather datastore capacity information
###############################################################################
function to-csv {
    param($outfile)
    $input | export-csv -notypeinformation -path $outfile
}

$vcservers = @()
$vcservers += connect-viserver vc-prod-1.vmware.com

# . ./vcservers.ps1

$start = (get-date).adddays(-7)
$finish = get-date

$vmmetrics = @()
$vmmetrics += "mem.usage.average"
$vmmetrics += "cpu.usage.average"
$vmmetrics += "disk.usage.average"
$vmmetrics += "net.usage.average"

###############################################################################

foreach ($vcserver in $vcservers) {

    # $datacenters = get-datacenter -server $vcserver
    # foreach ($datacenter in $datacenters) {
    # }

    $clusters = get-cluster sc9-prod-ebiz1
    $vms = get-vm -location $cluster
    get-stat -entity $vms -stat $vmmetrics -intervalmins 60 -start $start -finish $finish |
	select @{N="vmname";E={$_.entity}},
		timestamp,
		@{N="metric";E={$_.MetricId}},
		value,
		unit |
		    to-csv "sc9-prod-ebiz1-vms.csv"

###############################################################################
