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

$dbh->do('drop table if exists versions;');
$dbh->do('create table versions (vendor varchar(20),
				 device varchar(72),
				 model varchar(46),
				 versiontype varchar(32),
				 version varchar(32)
	);');

$dbh->disconnect();
