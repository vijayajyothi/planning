#!/usr/bin/perl

use strict;
use warnings;
use Text::CSV;
use Data::Dumper;

my $arraylistfile = '/mnt/datadepot/scripts/clariion/navi-arrays.txt';
my $rawdatadir = '/mnt/datadepot/LOGS/SAN';

my $csv = Text::CSV->new({binary => 1})
    or die "can't create CSV object: " . Text::CSV->error_diag(), "\n";

my $arrays = get_arraylist();

for my $ip (sort keys %$arrays) {
    print "$ip\t\t$arrays->{$ip}\n";
}

my $parsers = {
    'portlist' => \&parse_portlist,
};

my ($header, @rows) = parse_portlist();
open my $out, ">kevtemp.csv"
    or die "can't create kevtemp.csv: $!\n";
print $out join("\n", csv_row(@$header),
		map(csv_row(@$_), @rows),
		'');
close($out);

###############################################################################

sub parse_portlist {
    my $fieldmap = {
	'ip' => 'ip',
	'link_status' => 'Link Status',
	'name' => 'SP Name',
	'port_id' => 'SP Port ID',
	'port_status' => 'Port Status',
	'switch_present' => 'Switch Present',
	'wwnn' => 'wwnn',
	'wwpn' => 'wwpn',
    };

    my $fields;
    my @rows;

    for my $ip (list_array_ips()) {
	my $file = "$rawdatadir/portlists/$arrays->{$ip}-PORTLIST.txt";
	open my $in, $file or do {
	    warn "can't open $file: $!\n";
	    next;
	};
	local $/ = "\n\n";

	# skip first 2 stanzas
	<$in>; <$in>;

	while (<$in>) {
	    chomp;
	    my $data;
	    $data->{ip} = $ip;
	    for my $line (split(/\n/, $_)) {
		my ($key, $value) = split(/:\s*/, $line, 2);
		$fields->{$key}++;
		if ($key eq 'SP UID') {
		    if (substr($value, 2, 1) eq ':') {
			$data->{wwnn} = substr($value, 0, 23);
			$data->{wwpn} = substr($value, 24);
		    } else {
			($data->{wwnn}, $data->{wwpn}) = split(/:/, $value);
		    }
		} else {
		    $value =~ s/^SP\s//
			if ($key eq 'SP Name');
		    $data->{$key} = $value;
		}
	    }
	    push @rows, [map(maybe($data->{$_}),
			     map($fieldmap->{$_},
				 sort keys %$fieldmap))];
	}
	close($in);
    }

    return([sort(keys %$fieldmap)], @rows);
}

sub csv_row {
    $csv->combine(@_);
    return $csv->string();
}

sub maybe { return(defined($_[0])?$_[0]:'') }

sub list_array_ips { sort keys %$arrays }

sub get_arraylist {
    my $arraya;

    open my $in, $arraylistfile
	or die "can't open $arraylistfile: $!\n";
    while (<$in>) {
	chomp;
	next if /^#/;
	my ($ipaddr, $arrayname) = split(/\s+/, $_, 2);
	$arrays->{$ipaddr} = $arrayname;
    }
    close($in);

    return $arrays;
}

###############################################################################
