#!/usr/bin/perl

use strict;
use warnings;
use Text::CSV;

my $files = '/data/inventory-pull/csv/storage/avamar/clients*';

my @fields = qw(display_client_name agent_version);

my $csv = Text::CSV->new({binary => 1})
	or die "Can''t use CSV: " . Text::CSV->error_diag();

# print join(',', 'vendor', 'device', 'model', 'versiontype', 'version'), "\n";
for my $file (glob($files)) {
	my $fh;
	open $fh, $file or die "can't open $file: $!\n";
	$csv->column_names($csv->getline($fh));

	while (my $row = $csv->getline_hr($fh)) {
	    print '"', join('","',
	    		    'avamar',
			    $row->{'display_client_name'},
			    'avamar client',
			    'version',
			    $row->{'agent_version'}), "\"\n";
	}
	close($fh);
}

