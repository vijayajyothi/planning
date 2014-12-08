#!/usr/bin/perl

use strict;
use warnings;
use Text::CSV;

my $file = '/data/inventory-pull/csv/esx/powercli/hosts.csv';

my @fields = qw(vmhost esxproductname esxversion esxbuild);

# my $csv = Text::CSV->new({binary => 1})
my $csv = Text::CSV->new({binary => 0})
	or die "Can''t use CSV: " . Text::CSV->error_diag();

open my $fh, $file or die "can't open $file: $!\n";
$csv->column_names($csv->getline($fh));

# print join(',', 'vendor', 'device', 'model', 'versiontype', 'version'), "\n";
while (my $row = $csv->getline_hr($fh)) {
    my $model = $row->{esxproductname};
    $model =~ s/^vmware //i;
    print '"', join('","',
    		    'vmware',
		    $row->{vmhost},
		    $model,
		    'version',
		    "$row->{esxversion} $row->{esxbuild}"), "\"\n";
}
close($fh);

