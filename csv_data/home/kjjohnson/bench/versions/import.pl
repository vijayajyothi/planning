#!/usr/bin/perl

use strict;
use warnings;
use DBI;
use Text::CSV;

my $database = 'layer1versions';
my $host = 'localhost';
my $user = 'version';
my $password = 'outofdate';

my $csvfile = 'csv/all.csv';

my $dsn = "DBI:mysql:database=$database;host=$host";
my $dbh = DBI->connect($dsn, $user, $password, {'RaiseError' => 1});

# $dbh->do('create table versions (vendor varchar(20),
				 # device varchar(64),
				 # model varchar(42),
				 # versiontype varchar(32),
				 # version varchar(32)
	# );');

my $csv = Text::CSV->new({binary => 1})
	or die "can't use CSV: " . Text::CSV->error_diag();

open my $fh, $csvfile or die "can't open $csvfile: $!\n";

my $columns = $csv->getline($fh);
$csv->column_names($columns);

my $sth = $dbh->prepare('insert into versions (vendor, device, model, versiontype, version) values (?, ?, ?, ?, ?);');

$dbh->do('delete from versions;');

while (my $row = $csv->getline_hr($fh)) {
	# print $row->{vendor}, ' ' , $row->{device}, ' ', $row->{model}, "\n";
	my $model = $row->{model};
	$model =~ s/\s+$//;
	my $version = $row->{version};
	$version =~ s/\s+//;
	$sth->execute($row->{vendor},
		$row->{device},
		$model,
		$row->{versiontype},
		$version);
}

$dbh->disconnect();
