#!/usr/bin/perl

use strict;
use warnings;
use Text::CSV;

my $basedir = '/mnt/datadepot/LOGS/VMAX';

my $data;

my $symmetrixid;
my $localremote;

my $csv = Text::CSV->new ({binary => 1})
	or die "Cannot create CSV object: " . Text::CSV->error_diag();

open my $in, "$basedir/enginuitycode.log";
while (<$in>) {
	chomp;
	s/\s*\r$//;
	if (/^Symmetrix ID:\s+([^\s]+)(.*)/) {
		$symmetrixid = $1;
		$localremote = $2;
	} elsif (/^\s+(Product Model)\s+:\s+(.*)$/) {
		$data->{$symmetrixid}{$1} = $2;
	} elsif (/^\s+(Microcode Version) \(Number\)\s+:\s([^\s]+)/) {
		$data->{$symmetrixid}{$1} = $2;
	} elsif (/^\s+(Microcode Registered Build)\s+:\s(.*)$/) {
		$data->{$symmetrixid}{$1} = $2;
	} elsif (/^\s+(Microcode Patch Level)\s+:\s(.*)$/) {
		$data->{$symmetrixid}{$1} = $2;
	} elsif (/^\s+(Symmwin Version)\s+:\s(.*)$/) {
		$data->{$symmetrixid}{$1} = $2;
	} elsif (/^\s+(Enginuity Build Version)\s+:\s(.*)$/) {
		$data->{$symmetrixid}{$1} = $2;
	} elsif (/^\s+(Symmetrix CLI \(SYMCLI\) Version)\s+:\s(.*)$/) {
		$data->{$symmetrixid}{$1} = $2;
	} elsif (/^\s+(Powerpath Run Time Version)\s+:\s(.*)$/) {
		$data->{$symmetrixid}{$1} = $2;
	}
}
close($in);

my %keys;
for my $symmetrix (sort keys %$data) {
	for my $key (sort keys %{$data->{$symmetrix}}) {
		$keys{$key} = 1;
	}
}

print csv_row(sort keys %keys), "\n";
for my $symmetrix (sort keys %$data) {
	print csv_row(map(defined($data->{$symmetrix}{$_})
			  ?$data->{$symmetrix}{$_}
			  :'',
			    sort keys %keys)), "\n";
}
###############################################################################
sub csv_row {
	$csv->combine(@_);
	return $csv->string();
}
###############################################################################
