#!/usr/bin/perl

use strict;
use warnings;
use Spreadsheet::WriteExcel;

my $spreadsheet = 'model_health.xls';

my $workbook = Spreadsheet::WriteExcel->new($spreadsheet)
	or die "can't create spreadsheet: $!\n";

my $prev_vendor = '';
my $worksheet;
my $row;
my $header = <>;
while (<>) {
	chomp;
	my @fields = split(/\t/, $_, 4);
	next if $fields[0] eq '';
	next if $fields[0] eq 'vmware';
	if ($fields[0] ne $prev_vendor) {
		$worksheet = $workbook->add_worksheet($fields[0]);
		$prev_vendor = $fields[0];
		$row = 0;
		$worksheet->set_column(0, 4, 32);
		$worksheet->write($row, 0, 'Model');
		$worksheet->write($row, 1, 'Version Type');
		$worksheet->write($row, 2, 'Version');
		$worksheet->write($row, 3, 'Recommended Version');
		$worksheet->write($row, 4, 'Version Date');
		# $worksheet->write_row($row, 0,
				# ['Model', 'Version Type', 'Version',
				 # 'Recommended Version',
				 # 'Version Date',
				# ]);
		$row++;
	}
	$fields[3] = 'none' if $fields[3] eq '';
	$worksheet->write($row, 0, $fields[1]);
	$worksheet->write($row, 1, $fields[2]);
	$worksheet->write($row, 2, $fields[3]);
	$worksheet->write($row, 3, '');
	$worksheet->write($row, 4, '');
	# $worksheet->write_row($row, 0, [$fields[1], $fields[2], $fields[3], '', '']);
	$row++;
}

$workbook->close();

