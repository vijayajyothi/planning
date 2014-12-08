#!/usr/bin/perl

use strict;
use warnings;
use Text::CSV;

my $file = '/data/inventory-pull/csv/storage/naviseccli/sps.csv';

my @fields = qw(arrayname assemblyname emc_part_num emc_assy_rev emc_art_rev);

my $csv = Text::CSV->new({binary => 1})
	or die "Can''t use CSV: " . Text::CSV->error_diag();

open my $fh, $file or die "can't open $file: $!\n";
$csv->column_names($csv->getline($fh));

# print join(',', 'vendor', 'device', 'model', 'versiontype', 'version'), "\n";
while (my $row = $csv->getline_hr($fh)) {
    print '"', join('","',
    		    'emc',
		    $row->{arrayname},
		    "$row->{assemblyname} ($row->{emc_part_num})",
		    'sps assy_rev',
		    $row->{emc_assy_rev}),
		    "\"\n";
}
close($fh);

