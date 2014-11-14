#!/usr/bin/perl

use strict;
use warnings;
use Text::CSV;

my $file = '/data/inventory-pull/csv/storage/naviseccli/disks.csv';

my @fields = qw(vendor arrayname productId productRev);

my $csv = Text::CSV->new({binary => 1})
	or die "Can''t use CSV: " . Text::CSV->error_diag();

open my $fh, $file or die "can't open $file: $!\n";
$csv->column_names($csv->getline($fh));

# print join(',', 'vendor', 'device', 'model', 'versiontype', 'version'), "\n";
while (my $row = $csv->getline_hr($fh)) {
    next if $row->{vendor} eq '';
    print '"', join('","',
    		    'emc',
		    $row->{arrayname},
		    $row->{productId},
		    'array disk productRev',
		    $row->{productRev}), "\"\n";
}
close($fh);

