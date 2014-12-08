#!/usr/bin/perl

use strict;
use warnings;
use Text::CSV;

my $file = '/data/inventory-pull/csv/loadbalancers/f5/devices.csv';

my @fields = qw(primaryunit model version);

my $csv = Text::CSV->new({binary => 1})
	or die "Can''t use CSV: " . Text::CSV->error_diag();

open my $fh, $file or die "can't open $file: $!\n";
$csv->column_names($csv->getline($fh));

# print join(',', 'vendor', 'device', 'model', 'versiontype', 'version'), "\n";
while (my $row = $csv->getline_hr($fh)) {
    print '"', join('","',
    			   'f5',
    			   $row->{primary_unit},
			   $row->{model},
			   'version',
			   $row->{version}), "\"\n";
}
close($fh);

