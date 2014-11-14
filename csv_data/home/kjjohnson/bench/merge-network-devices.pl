#!/usr/bin/perl

use strict;
use warnings;
use Text::CSV;

my $ehealthcsv = '/data/inventory-pull/csv/network/ehealth/devices.csv';
my $spectrumcsv = '/data/inventory-pull/csv/network/spectrum/devices.csv';
my $toptrackcsv = '/data/inventory-pull/csv/assettracking/toptrack/itops.csv';

my $csv = Text::CSV->new({binary => 1})
	or die "can't use Text::CSV: " . Text::CSV->error_diag(), "\n";

my $ehealthdata = ingest_csv($ehealthcsv);
my $spectrumdata = ingest_csv($spectrumcsv);
my $toptrackdata = ingest_csv($toptrackcsv);
###############################################################################
my $uniques;

for my $row (@$ehealthdata) {
	set_unique('ehealth', 'hostname', $row->{hostname});
	set_unique('ehealth', 'ipaddress', $row->{ipaddr});
	$uniques->{ehealth}{qty}++;
}

for my $row (@$spectrumdata) {
	set_unique('spectrum', 'serialnumber', $row->{serialnumber});
	set_unique('spectrum', 'ipaddress', $row->{ipaddress});
	$uniques->{spectrum}{qty}++;
}

for my $row (@$toptrackdata) {
	set_unique('toptrack', 'serialnumber', $row->{main_serial_number});
	set_unique('toptrack', 'hostname', $row->{hostname});
	set_unique('toptrack', 'ipaddress', $row->{ip_address});
	$uniques->{toptrack}{qty}++;
}


count('ehealth', 'hostname');
count('ehealth', 'ipaddress');
count('spectrum', 'ipaddress');
count('spectrum', 'serialnumber');
count('toptrack', 'serialnumber');
count('toptrack', 'hostname');
count('toptrack', 'ipaddress');

compare('toptrack', 'spectrum', 'ipaddress');
compare('spectrum', 'toptrack', 'ipaddress');
compare('toptrack', 'ehealth', 'ipaddress');
compare('ehealth', 'toptrack', 'ipaddress');
compare('spectrum', 'ehealth', 'ipaddress');
compare('ehealth', 'spectrum', 'ipaddress');

compare('ehealth', 'toptrack', 'hostname');
compare('toptrack', 'ehealth', 'hostname');
compare('spectrum', 'toptrack', 'serialnumber');
compare('toptrack', 'spectrum', 'serialnumber');

###############################################################################
sub count {
	my $type = shift;
	my $key = shift;
	my $count = scalar(keys %{$uniques->{$type}{$key}});
	print "$type $key count: $count\n";
}

sub compare {
	my $type1 = shift;
	my $type2 = shift;
	my $key = shift;

	my $count = 0;
	for my $item (list_items($type1, $key)) {
		if (defined($uniques->{$type2}{$key}{lc($item)})) {
			$count++;
		}
	}
	print "$type1 -> $type2 match $key: $count\n";
}

sub list_items {
	my $type = shift;
	my $key = shift;
	return keys %{$uniques->{$type}{$key}};
}

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

sub set_unique  {
	my $type = shift;
	my $key = shift;
	my $value = shift;

	$uniques->{$type}{$key}{$value} = lc($value);
}
###############################################################################
