#!/usr/bin/perl

use strict;
use warnings;
use Text::CSV;

my $ehealthcsv = '/data/inventory-pull/csv/network/ehealth/devices.csv';
my $spectrumcsv = '/data/inventory-pull/csv/network/spectrum/devices.csv';
my $pnicscsv = '/data/inventory-pull/csv/esx/powercli/pnics.csv';

my $csv = Text::CSV->new({binary => 1})
	or die "can't use Text::CSV: " . Text::CSV->error_diag(), "\n";

my $ehealthdata = ingest_csv($ehealthcsv);
my $spectrumdata = ingest_csv($spectrumcsv);
my $pnicsdata = ingest_csv($pnicscsv);
###############################################################################

my %netipaddrs;

for my $row (@$ehealthdata) {
	$netipaddrs{$row->{ipaddr}}++
		if defined($row->{ipaddr}) and $row->{ipaddr} ne '';
}
for my $row (@$spectrumdata) {
	$netipaddrs{$row->{ipaddress}}++
		if defined($row->{ipaddress}) and $row->{ipaddress} ne '';
}

my %esxnetpeers;
for my $row (@$pnicsdata) {
	my $peer = $row->{peeripaddress};
	if (defined($netipaddrs{$peer})) {
		$esxnetpeers{$row->{peeripaddress}} = $peer;
	} else {
		$esxnetpeers{$row->{peeripaddress}} = '';
	}
}

my $match = 0;
my $nomatch = 0;
for my $key (keys %esxnetpeers) {
	if ($esxnetpeers{$key} eq '') {
		$nomatch++;
	} else {
		$match++;
	}
}

print "qty net ip addrs = " . scalar(keys %netipaddrs) . "\n";;
print "qty esx net peers = " . scalar(keys %esxnetpeers) . "\n";;
print "match = $match\n";
print "nomatch = $nomatch\n";

exit;

###############################################################################

sub ingest_csv {
	my $file = shift;
	my $data;
	open my $fhin, $file
		or die "can't open $file: $!\n";
	my $header = $csv->getline($fhin);
	$csv->column_names($header);
	while (my $row = $csv->getline_hr($fhin)) {
		push @$data, $row;
	}
	close($fhin);
	return $data;
}

###############################################################################
