###############################################################################
# Gather datastore capacity information
###############################################################################
function to-csv {
    param($outfile)
    $input | export-csv -notypeinformation -path $outfile
}

# $vcservers = @()
# $vcservers += connect-viserver vc-prod-1.vmware.com
. ./vcservers.ps1

$start = (get-date).adddays(-7)
$finish = get-date

$vmmetrics = @()
$vmmetrics += "mem.usage.average"
$vmmetrics += "cpu.usage.average"
$vmmetrics += "disk.usage.average"
$vmmetrics += "net.usage.average"

$rows = @();

###############################################################################

foreach ($vcserver in $vcservers) {
    echo $vcserver

    $vmhosts = get-vmhost -server $vcserver

    foreach ($vmhost in $vmhosts) {

	$vms = get-vm -server $vcserver

	foreach ($vm in $vms) {
	    $stats = get-stat -entity $vm -server $vcserver -stat $vmmetrics -intervalmins 60 -start $start -finish $finish
	    $stats | Group-Object -Property EntityId | %{
		$cpustat = $_.Group | where {$_.MetricId -eq "cpu.usage.average"} | Measure-Object -Property Value -Average -Maximum -Minimum
		$memstat = $_.Group | where {$_.MetricId -eq "mem.usage.average"} | Measure-Object -Property Value -Average -Maximum -Minimum
		$diskstat = $_.Group | where {$_.MetricId -eq "disk.usage.average"} | Measure-Object -Property Value -Average -Maximum -Minimum
		$netstat = $_.Group | where {$_.MetricId -eq "net.usage.average"} | Measure-Object -Property Value -Average -Maximum -Minimum
	    }
	    $row = "" | select vcname, clustername, vmname, cpu_max, cpu_avg, cpu_min, mem_max, mem_avg, mem_min, disk_max, disk_avg, disk_min, net_max, net_avg, net_min
	    $row.vcname = $line.vcname
	    $row.clustername = $line.clustername
	    $row.vmname = $line.vmname
	    $row.cpu_min = $cpustat.Minimum
	    $row.cpu_avg = $cpustat.Average
	    $row.cpu_max = $cpustat.Maximum
	    $row.mem_min = $memstat.Minimum
	    $row.mem_avg = $memstat.Average
	    $row.mem_max = $memstat.Maximum
	    $row.disk_min = $diskstat.Minimum
	    $row.disk_avg = $diskstat.Average
	    $row.disk_max = $diskstat.Maximum
	    $row.net_min = $netstat.Minimum
	    $row.net_avg = $netstat.Average
	    $row.net_max = $netstat.Maximum

	    $rows += $row
	}
    }
}

$rows | to-csv "vm-utilization.csv"

###############################################################################
