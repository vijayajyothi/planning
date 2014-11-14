#!/usr/bin/perl

use strict;
use warnings;
use Text::CSV;

my $file = '/data/inventory-pull/csv/storage/naviseccli/arrays.csv';

my @fields = qw(name model);
my @revfields = qw(agentrev promrev revision);

# my $csv = Text::CSV->new({binary => 1})
my $csv = Text::CSV->new({binary => 0})
	or die "Can''t use CSV: " . Text::CSV->error_diag();

open my $fh, $file or die "can't open $file: $!\n";
$csv->column_names($csv->getline($fh));

# print join(',', 'vendor', @fields, 'versiontype', 'value'), "\n";
while (my $row = $csv->getline_hr($fh)) {
    for my $verfield (@revfields) {
        print '"', join('","', 'emc', map($row->{$_}, @fields), $verfield, $row->{$verfield}), "\"\n";
    }
}
close($fh);

