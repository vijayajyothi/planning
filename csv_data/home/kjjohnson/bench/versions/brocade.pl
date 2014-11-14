#!/usr/bin/perl

use strict;
use warnings;

my $fileglob = '/mnt/datadepot/LOGS/switch/supportshow/*';

# print "vendor,device,model,versiontype,version\n";
for my $file (glob($fileglob)) {
	my $switchname = $file;
	my $version = '';
	my $partnum = '';
	$switchname =~ s/^.*\///;
	$switchname =~ s/-SUPPORTSHOW\.txt$//;
	open(my $fh, $file) or die "can't open $file: $!\n";

	while (<$fh>) {
		if (/^Fabric OS:\s*(.*)$/) {
			$version = $1;
		} elsif (/^Part Num:\s*(.*)$/) {
			$partnum = $1;
			print "\"brocade\",\"$switchname\",\"$partnum\",version,\"$version\"\n";
			last;
		}
	}

	close($fh);
}
