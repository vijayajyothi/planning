#!/usr/bin/perl

use strict;
use warnings;
use Text::CSV;

my $file = '/data/inventory-pull/csv/network/spectrum/devices.csv';

my %grabthese = ('Switch' => 1,
	'Router' => 1,
	'Switch-Router' => 1);

my @fields = qw(manu ipaddr model version);

my $csv = Text::CSV->new({binary => 1})
	or die "Can''t use CSV: " . Text::CSV->error_diag();

open my $fh, $file or die "can't open $file: $!\n";
$csv->column_names($csv->getline($fh));

# print join(',', 'vendor', 'device', 'model', 'versiontype', 'version'), "\n";
while (my $row = $csv->getline_hr($fh)) {
    next unless (defined($grabthese{$row->{devicetype}})
		|| $row->{manufacturer} eq 'Avaya');
    my $manu = lc($row->{manufacturer});
    $manu =~ s/silver peak/silverpeak/;
    $manu =~ s/ .*//;
    $manu =~ s/,$//;
    next if $manu eq '';
    next if $manu eq 'hewlett';
    $row->{name} =~ s/^"//;
    $row->{name} =~ s/"$//;
    # next if $row->{firmwareversion} eq '';
    print '"', join('","',
		    $manu,
		    $row->{name},
		    $row->{model},
		    'version',
		    $row->{firmwareversion}), "\"\n";
}
close($fh);

