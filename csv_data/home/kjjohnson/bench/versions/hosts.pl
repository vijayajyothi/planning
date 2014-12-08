#!/usr/bin/perl

use strict;
use warnings;
use Text::CSV;

my $file = '/data/inventory-pull/csv/esx/powercli/hosts.csv';

my @fields = qw(vendor vmhost model biosversion);

# my $csv = Text::CSV->new({binary => 1})
my $csv = Text::CSV->new({binary => 0})
	or die "Can''t use CSV: " . Text::CSV->error_diag();

open my $fh, $file or die "can't open $file: $!\n";
$csv->column_names($csv->getline($fh));

# print join(',', 'vendor', 'device', 'model', 'versiontype', 'version'), "\n";
while (my $row = $csv->getline_hr($fh)) {
    my $vendor = lc($row->{vendor});
    $vendor =~ s/ .*//;
    print '"', join('","',
    		    $vendor,
		    $row->{vmhost},
		    $row->{model},
		    'biosversion',
		    $row->{biosversion}), "\"\n";
}
close($fh);

