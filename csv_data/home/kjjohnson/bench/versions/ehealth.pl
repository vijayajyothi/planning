#!/usr/bin/perl

use strict;
use warnings;
use Text::CSV;

my $file = '/data/inventory-pull/csv/network/ehealth/devices.csv';

my %grabthese = ('Cisco' => 1,
	'Juniper' => 1,
	'Extreme' => 1);

my @fields = qw(manu ipaddr model version);

my $csv = Text::CSV->new({binary => 1})
	or die "Can''t use CSV: " . Text::CSV->error_diag();

open my $fh, $file or die "can't open $file: $!\n";
$csv->column_names($csv->getline($fh));

# print join(',', 'vendor', 'device', 'model', 'versiontype', 'version'), "\n";
while (my $row = $csv->getline_hr($fh)) {
    next unless defined($grabthese{$row->{manu}});
    print '"', join('","',
    		    lc($row->{manu}),
		    $row->{ipaddr},
		    $row->{model},
		    'version',
		    $row->{version}), "\"\n";
}
close($fh);

