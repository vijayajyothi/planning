#!/usr/bin/perl

use strict;
use warnings;
use Text::CSV;

my $spectrumcsv = '/data/inventory-pull/csv/network/spectrum/devices.csv';
my $hpsiminventorycsv = 'hpsim/csv/r_inventory.csv';
# productname - Cisco
# ipaddress

my $csv = Text::CSV->new({binary => 1})
	or die "can't use Text::CSV: " . Text::CSV->error_diag(), "\n";

my $spectrumdata = ingest_csv($spectrumcsv);
my $hpsimdata = ingest_csv($hpsiminventorycsv);
###############################################################################

my %spectrumipaddrs;

for my $row (@$spectrumdata) {
	$spectrumipaddrs{$row->{ipaddress}}++
		if defined($row->{ipaddress}) and $row->{ipaddress} ne '';
}


for my $row (@$hpsimdata) {
	my $present = 'no';
	next unless ($row->{productname} =~ /^Cisco/);
	next unless ($row->{ipaddress} && $row->{ipaddress} ne '');
	if (defined($spectrumipaddrs{$row->{ipaddress}})) {
		$present = 'yes';
	}
	print "$row->{ipaddress}\t$present\n";
}


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
