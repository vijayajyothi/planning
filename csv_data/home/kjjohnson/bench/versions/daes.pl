#!/usr/bin/perl

use strict;
use warnings;
use Text::CSV;

my $file = '/data/inventory-pull/csv/storage/naviseccli/daes.csv';

my @fields = qw(arrayname assembly_name emc_part_num emc_art_rev);

my $csv = Text::CSV->new({binary => 1})
	or die "Can''t use CSV: " . Text::CSV->error_diag();

open my $fh, $file or die "can't open $file: $!\n";
$csv->column_names($csv->getline($fh));

# print join(',', 'vendor', 'device', 'model', 'versiontype', 'version'), "\n";
while (my $row = $csv->getline_hr($fh)) {
    next if $row->{'emc_art_rev'} eq 'N/A';
    print '"', join('","',
    		    'emc',
		    $row->{arrayname},
		    "$row->{assembly_name} ($row->{emc_part_num})",
		    'art_rev',
		    $row->{emc_art_rev}), "\"\n";
}
close($fh);

