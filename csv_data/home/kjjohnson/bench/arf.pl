#!/usr/bin/perl

use strict;
use warnings;
use DBI;

my $dbname = 'mcdb';
my $host = 'sc9-avamar1n1.vmware.com';
my $port = 5555;
my $user = 'viewuser';
my $pass = 'viewuser1';

my $dbh = DBI->connect("dbi:Pg:dbname=$dbname;host=$host;port=$port",
			$user, $pass,
			{RaiseError => 1,
			 AutoCommit => 0})
	or die $DBI::errstr;

# my $rv = $dbh->do("select count(*) from v_node_space;");
# select * from v_node_space;
my $sth = $dbh->prepare("select * from v_node_space;");
$sth->execute;
while (my $row = $sth->fetchrow_hashref) {
	print sort(keys %$row), "\n";
}

$dbh->disconnect;
