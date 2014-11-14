#!/usr/bin/perl

use strict;
use warnings;
use Text::CSV;

my $file = '/data/inventory-pull/csv/esx/powercli/vms.csv';

my @fields = qw(vcserver vmname version toolstatus toolsversion toolsrunningstatus);

# my $csv = Text::CSV->new({binary => 1})
my $csv = Text::CSV->new({binary => 0})
	or die "Can''t use CSV: " . Text::CSV->error_diag();

open my $fh, $file or die "can't open $file: $!\n";
$csv->column_names($csv->getline($fh));

# print join(',', 'vendor', 'device', 'model', 'versiontype', 'version'), "\n";
while (my $row = $csv->getline_hr($fh)) {
    print '"', join('","',
		    'vmware',
		    "$row->{vcserver}/$row->{vmname}",
		    'vm',
		    'firmware version',
		    $row->{version}), "\"\n";
    print '"', join('","',
		    'vmware',
		    "$row->{vcserver}/$row->{vmname}",
		    'vm',
		    'tools version',
		    "$row->{toolsversion} ($row->{toolstatus})"
		    ), "\"\n";
}
close($fh);

