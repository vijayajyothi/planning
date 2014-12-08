#!/bin/bash
###############################################################################
# Contact Kevin Johnson <kjjohnson@vmware.com>.
#
# This script takes two control file: one for the list of arrays and
# another for the list of commands to execute on each array. It
# iterates through the list of arrays and executes all the commands,
# dumping the output to files for indexing by Splunk. It takes a
# command-line arg that specified which subset to run, useful for cron
# jobs.
#
# navi-arrays.txt contains a list of lines, one per array.
#    the first word on the line is the ip address of the array
#    the second work on the line is the name of the array
# navi-commands.txt contains a list of commands to be executes
#    the first word notes which schedule
#        pass a schedule string on the command line to select only those
#        lines that match the desired schedule string
#    the 2nd word is the tag for the command
#        this is used as part of the filename when saving the output
#   the 3rd word is the subdirectory for depositing the file
#        also, the basedir variable controls the parent directory for the subdir
#  the remaining words are the command and args to be executes on each array
###############################################################################
desired_sched="$1"

arraylist="navi-arrays.txt"
commandlist="navi-commands.txt"
basedir="/tmp/test"

while read ipaddr arrayname
do
    firstchar=${ipaddr:0:1}
    [ "$firstchar" != '#' ] || continue
    while read schedule tag dir command
    do
	firstchar=${schedule:0:1}
	[ "$firstchar" != '#' ] || continue
	if [ "$desired_sched" -a "$desired_sched" != "$schedule" ]
	then
	    continue
	fi
	[ -d "$basedir/$dir" ] || mkdir -p "$basedir/$dir"
	echo $(date) >"$basedir/$dir/$arrayname.$tag.txt"
	/opt/Navisphere/bin/naviseccli -h "$ipaddr" $command >>"$basedir/$dir/$arrayname-$tag.txt"
    done <$commandlist
done <$arraylist

###############################################################################
