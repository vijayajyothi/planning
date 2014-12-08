#!/usr/bin/perl

use strict;
use warnings;
# use Data::Dumper;

my $csvdir = "/data/inventory-pull/csv/storage/naviseccli";
# my $naviseccli = '/cygdrive/c/Program\ Files/EMC/Navisphere\ CLI/NaviSECCli';
my $naviseccli = '/opt/Navisphere/bin/naviseccli';
my $hostfile = 'emc-arrays.txt';

my $storagehosts = get_array_list();

my $storagegroups;

my ($sec, $min, $hour, $mday, $mon, $year, $rest) = localtime(time);
my $now = sprintf("%d-%d-%d %d:%d:%d",
		  $year + 1900,
		  $mon + 1,
		  $mday,
		  $hour,
		  $min,
		  $sec);

###############################################################################

open my $storagegroupout, ">$csvdir/storagegroups.csv"
    or die "can't create $csvdir/storagegroups.csv";
open my $sglunmapout, ">$csvdir/storagegrouplunmap.csv"
    or die "can't create $csvdir/storagegrouplunmap.csv";

my @ipaddrs = sort keys %$storagehosts;
my $data = get_data(@ipaddrs);

close($storagegroupout);
close($sglunmapout);

exit 0;

###############################################################################
# The main loop.

sub get_data {
    print $storagegroupout "timestamp,server,wwnn,wwpn,storagegroup,arrayname,arrayipaddress\n";
    print $sglunmapout "timestamp,arrayipaddress,storagegroup,alu,hlu\n";
    for my $ipaddr (@_) {
	warn "[$ipaddr]\n";
	my @lines = run_naviseccli($ipaddr, "storagegroup -list -host");
	parse_storagegroups($ipaddr, @lines);
    }
}

###############################################################################
# Parse storagegroup information

sub parse_storagegroups {
    my $ipaddr = shift;
    my $storagegroup;
    my $hbauid;
    my $sp;
    my $spport;
    my $data;
    for my $line (@_) {
	if ($line =~ /^Storage Group Name:\s+(.*)$/) {
	    $storagegroup = $1;
	} elsif ($line =~ /^  ([0-9A-F][0-9A-F]:[0-9A-F][0-9A-F]:[^ ]+)\s+(SP .)\s+(\d+)$/) {
	    $hbauid = $1;
	    $sp = $2;
	    $spport = $3;
	} elsif ($line =~ /^Host name:\s+(.*)$/) {
	    $data->{hosts}{$1}{$storagegroup} = {
		ipaddr => $ipaddr,
		hbauid => $hbauid,
	    }
	} elsif ($line =~ /^\s+(\d+)\s+(\d+)$/) {
	    $data->{sgs}{$ipaddr}{$storagegroup}{$2} = $1;
	}
    }
    for my $host (sort keys %{$data->{hosts}}) {
	for my $sg (sort keys %{$data->{hosts}{$host}}) {
	    my $ipaddr = $data->{hosts}{$host}{$sg}{ipaddr};
	    my $arrayname = $storagehosts->{$ipaddr}{Name};
	    my $hbaww = $data->{hosts}{$host}{$sg}{hbauid};
	    $hbaww =~ s/://g;
	    my $wwnn = lc substr($hbaww, 0, 16);
	    my $wwpn = lc substr($hbaww, 16);
	    print $storagegroupout "$now,$host,$wwnn,$wwpn,$sg,$arrayname,$ipaddr\n";
	}
    }
    for my $ipaddr (keys %{$data->{sgs}}) {
	for my $sg (keys %{$data->{sgs}{$ipaddr}}) {
	    for my $alu (keys %{$data->{sgs}{$ipaddr}{$sg}}) {
		print $sglunmapout "$now,$ipaddr,$sg,$alu,$data->{sgs}{$ipaddr}{$sg}{$alu}\n";
	    }
	}
    }
}

###############################################################################
# Runs naviseccli with specified options and returns a list of the
# lines returned by naviseccli without EOL characters at the end of
# each line.

sub run_naviseccli {
    my $ipaddr = shift;
    my $cmd = shift;

    my @ret;

    my $in;

    unless (open($in, "$naviseccli -h $ipaddr $cmd |")) {
	warn "can't run naviseccli: $!\n";
	return ();
    }
    while (<$in>) {
	chomp;
	s/\r$//;		# dos carriage returns :(
	s/\s+$//;		# delete trailing whitespace
	if (/^Authentication failed/) {
	    @ret = undef;
	    warn "Can't authenticate to $ipaddr \n";
	    last;
	} elsif (/^Exception:/) {
	    warn "$_\n";
	    last;
	}
	push @ret, $_;
    }
    unless (close($in)) {
	warn "$naviseccli returned failure for array $ipaddr\n";
	return ();
    }

    return @ret;
}

###############################################################################
# Readers a text files containing the arrays to query and returns a
# hash with the information from the file. This will eventually be
# replaced with a better mechanism, such as using storage domains.

sub get_array_list {
    my $arrays;

    open(my $in, $hostfile)
	or die "can't open $hostfile: $!\n";
    my $header = <$in>;
    while (<$in>) {
	chomp;
	s/\r$//;		# dos carriage returns :(

	my ($name, $model, $location, $ipaddr, $secipaddr, $serial) = split(/\t/);

	$arrays->{$ipaddr}{Name} = $name;
	$arrays->{$ipaddr}{Model} = $model;
	$arrays->{$ipaddr}{Local} = $location;
    }
    close $in;

    return $arrays;
}

###############################################################################
