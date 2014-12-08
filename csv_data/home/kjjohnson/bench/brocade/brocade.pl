#!/usr/bin/perl

# This script scrapes data out of a directory of files containing
# supportshow output.

use strict;
use warnings;
use File::Basename;
use Text::CSV;
use Data::Dumper;

my $csvbase = '/data/inventory-pull/csv/storage/brocade';

my $csv = Text::CSV->new({binary => 1})
	or die "can't create CSV object: " . Text::CSV->error_diag();

my $brocadedir = '/mnt/datadepot/LOGS/switch/supportshow';

my $stanza; # which section of the supportshow output are we looking at

my %interestingstanzas = (
	'initial' => \&process_initial,
	'start_system_cmd' => \&process_system_cmd,
	'start_fc_fabric_cmd' => \&process_fc_fabric,
);

my $switchname;
my $switchdata;
my $zonedata;
my $portdata;
my $isldata;

for my $file (glob("$brocadedir/*")) {
# for my $file ("$brocadedir/osdc-fab11sw1-SUPPORTSHOW.txt") {
	my $state = {};
	$stanza = 'initial';
	my $basename = basename($file);
	$basename =~ /^(.*)-SUPPORTSHOW.txt$/;
	$switchname = $1;
	print "$switchname\n";
	open(my $in, $file);
	unless ($in) {
		warn "can't open $file: $!\n";
		next;
	}
	while (<$in>) {
		chomp;
		# supportshow is grouped into stanzas
		# note stanza start and stop and note which stanza
		if (/^\*\*\*\* Begin (.*) group \*\*\*\*/) {
			$stanza = $1;
			next;
		} elsif (/^\*\*\*\* End (.*) group \*\*\*\*/) {
			$stanza = '';
			next;
		}
		next unless defined($interestingstanzas{$stanza});
		next if $stanza eq '';
		s/\s+$//;
		&{$interestingstanzas{$stanza}}($state, $_);
	}
	close($in);
}

# print Dumper($switchdata, $zonedata), "\n";


# gather all the keys across all switches
my %keys;
for my $switch (keys %$switchdata) {
	for my $key (keys %{$switchdata->{$switch}}) {
		$keys{$key}++;
	}
}
my @csvlines = csv_row(sort keys %keys);
for my $switch (sort keys %$switchdata) {
	push @csvlines, csv_row(map($switchdata->{$switch}{$_},
				sort keys %keys));
}
save_str("brocade.csv", join("\n", @csvlines, ''));


@csvlines = csv_row('switchname', 'zone', 'wwn');
for my $switch (sort keys %$zonedata) {
	for my $zone (sort keys %{$zonedata->{$switch}}) {
		for my $item (@{$zonedata->{$switch}{$zone}}) {
			push @csvlines, csv_row($switch, $zone, $item);
		}
	}
}
save_str("brocade-zones.csv", join("\n", @csvlines, ''));


@csvlines = csv_row('switchname', 'index', 'slot', 'port', 'media', 'speed', 'state', 'protocol', 'porttype', 'wwn', 'comment');
for my $switch (sort keys %$portdata) {
	for my $port (@{$portdata->{$switch}}) {
		push @csvlines, csv_row($switch, @$port);
	}
}
save_str("brocade-ports.csv", join("\n", @csvlines, ''));

@csvlines = csv_row(
		'switchname', 'switchnum', 'islid', 'port', 'wwn', 'portid', 'switch', 'speed', 'bandwidth', 'options');
for my $switch (sort keys %$isldata) {
	for my $isl (@{$isldata->{$switch}}) {
		push @csvlines, csv_row($switch, @$isl);
	}
}
save_str("brocade-isl.csv", join("\n", @csvlines, ''));

###############################################################################

sub save_str {
	my $file = shift;
	my $str = shift;

	open my $out, ">$csvbase/$file"
		or die "can't create $csvbase/$file: $!\n";
	print $out $str;
	close($out);
}

sub csv_row {
	$csv->combine(@_);
	return $csv->string();
}

sub process_initial {
	my $state = shift;
	if (/^(Kernel):\s*(.*)$/) {
		set_switchdata($switchname, $1, $2);
	} elsif (/^(Fabric OS):\s*(.*)$/) {
		set_switchdata($switchname, $1, $2);
	} elsif (/^(BootProm):\s*(.*)$/) {
		set_switchdata($switchname, $1, $2);
	}
}

sub process_fc_fabric {
	my $state = shift;

	if ($state->{looking_at_cfgshow}) {
		if (/^\-\-\-\-\-\-\-\-/) {
			$state->{looking_at_cfgshow} = 0;
			return;
		}
		if (/^\s+zone:\s(.*)/) {
			$state->{zone} = $1;
		} elsif (/^\s+([0-9a-f]+:.*)/) {
			push @{$zonedata->{$switchname}{$state->{zone}}},
				$1;
		}
	} elsif ($state->{looking_at_islshow} && /^$/) {
		$state->{looking_at_islshow} = 0;
	} elsif ($state->{looking_at_islshow}) {
		return if /^\//;
		my ($index, $switchnum, $islid, $port, $wwn, $portid, $switch, $speed, $bandwidth, $options);
		if (/^No ISL found/) {
			return;
		} elsif (/^CURRENT CONTEXT/) {
			return;
		} elsif (/^\s+(\d+):\s+(\d+)->\s*(\d+)\s+([0-9a-z:]+)\s+(\d+)\s+([^\s]+)\s+sp:\s+([^\s]+)\s+bw:\s+([^\s]+)$/) {
			$index = $1;
			$switchnum = $2;
			$islid = $3;
			$wwn = $4;
			$portid = $5;
			$switch = $6;
			$speed = $7;
			$bandwidth = $8;
		} elsif (/^\s+(\d+):\s*(\d+)->\s*(\d+)\s+([0-9a-z:]+)\s+(\d+)\s+([^\s]+)\s+sp:\s+([^\s]+)\s+bw:\s+([^\s+]+)(\s+.*)?/){
			$switchnum = $1;
			$islid = $2;
			$port = $3;
			$wwn = $4;
			$portid = $5;
			$switch = $6;
			$speed = $7;
			$bandwidth = $8;
			if ($9) {
				$options = $9;
				$options =~ s/^\s+//;
			}
		} else {
			die "$switchname: unknown format in islshow data [$_]\n";
		}
		$options = '' unless defined($options);
		push @{$isldata->{$switchname}},
				[$switchnum, $islid, $port, $wwn, $portid,
				 $switch, $speed, $bandwidth, $options];
	} elsif (/^cfgshow:/) {
		$state->{looking_at_cfgshow} = 1;
	} elsif (/^islshow\s*:/) {
		$state->{looking_at_islshow} = 1;
	}
}

sub set_switchdata {
	my $switch = shift;
	my $key = shift;
	my $value = shift;

	$switchdata->{$switch}{$key} = $value;
}

sub process_system_cmd {
	my $state = shift;
	if (/^(IP address):\s*(.*)$/) {
		set_switchdata($switchname, $1, $2);
	} elsif (/^(switchName):\s*(.*)$/) {
		set_switchdata($switchname, $1, $2);
	} elsif (/^(switchType):\s*(.*)$/) {
		set_switchdata($switchname, $1, $2);
	} elsif (/^(switchState):\s*(.*)$/) {
		set_switchdata($switchname, $1, $2);
	} elsif (/^(switchId):\s*(.*)$/) {
		set_switchdata($switchname, $1, $2);
	} elsif (/^(switchWwn):\s*(.*)$/) {
		set_switchdata($switchname, $1, $2);
	} elsif (/^(switchDomain):\s*(.*)$/) {
		set_switchdata($switchname, $1, $2);
	} elsif (/^(Factory Part Num):\s*(.*)$/) {
		set_switchdata($switchname, $1, $2);
	} elsif (/^(Factory Serial Num):\s*(.*)$/) {
		set_switchdata($switchname, $1, $2);
	} elsif (/^(Part Num):\s*(.*)$/) {
		set_switchdata($switchname, $1, $2);
	} elsif (/^(Serial Num):\s*(.*)$/
		 && $state->{looking_at_chassisshow}) {
		set_switchdata($switchname, $1, $2);
	} elsif (/^chassisshow:/) {
		$state->{looking_at_chassisshow} = 1;
	} elsif (/^switchshow:/) {
		$state->{looking_at_switchshow} = 1;
	} elsif ($state->{looking_at_switchshow} && (/^Index/ || /^Area/)) {
		$state->{parsing_ports} = 1;
		my $i = 0;
		for my $fieldname (split(/\s+/)) {
			$state->{fieldnames}{$fieldname} = $i;
			$i++;
		}
	} elsif ($state->{looking_at_switchshow} && /^\=\=\=\=\=\=/) {
		$state->{parsing_ports} = 1;
	} elsif ($state->{parsing_ports} && /^$/) {
		$state->{looking_at_switchshow} = 0;
		$state->{parsing_ports} = 0;
	} elsif ($state->{parsing_ports}) {
		s/^\s+//;
		my $numfields = scalar(keys %{$state->{fieldnames}});
		my @fields = split(/\s+/, $_, $numfields);
		my $statefield = $fields[$state->{fieldnames}{State}];
		return if $statefield eq 'No_Light';
		return if $statefield eq 'No_Module';
		return if $statefield eq 'No_Sync';
		return if $statefield eq 'In_Sync';
		my $proto = $fields[$state->{fieldnames}{Proto}];
		my @subfields = split(/\s+/, $proto);
		my $prototype = '';
		if ($subfields[1] && $subfields[1] =~ /^[A-Z]-Port/) {
			$prototype = $subfields[0];
			shift(@subfields);
		}
		my $porttype = '';
		if ($subfields[0] =~ /^[A-Z]-Port/) {
			$porttype = $subfields[0];
			shift(@subfields);
		}
		my $wwn = '';
		if ($subfields[0] && $subfields[0] =~ /^[0-9a-f][0-9a-f:]+$/) {
			$wwn = $subfields[0];
			shift(@subfields);
		}
		if ($subfields[0] && $subfields[0] && $subfields[0] =~ /^\"/) {
			shift(@subfields);
		}
		my $notes = join(' ', @subfields);
		push @{$portdata->{$switchname}},
			[map(defined($state->{fieldnames}{$_})
			    ?$fields[$state->{fieldnames}{$_}]
			    :'',
			    'Index', 'Slot', 'Port', 'Media',
			    'Speed', 'State'),
			$prototype,
			$porttype,
			$wwn,
			$notes];
		# my $statefield = $fields[$state->{fieldnames}{State}];
		# push @{$portdata->{$switchname}},
			# [@fields[0 .. ($numfields - 2)], @subfields[0, 1], $wwn, $subfields[2]];

		# print "port: ", join(',', @fields[0 .. 6], @subfields[0, 1], $wwn, $subfields[2]), "\n";
	}
}

###############################################################################
