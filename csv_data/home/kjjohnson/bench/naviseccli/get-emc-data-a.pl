#!/usr/bin/perl

use strict;
use warnings;
use Storable qw(nstore);

# objects:
#   ip addrs
#   shelves
#   luns
#   packages
#   storage processors
#   storage groups
#   raid groups

my @domain_masters = ('10.113.58.145');

# my $naviseccli = '/cygdrive/c/Program\ Files/EMC/Navisphere\ CLI/NaviSECCli';
my $naviseccli = '/opt/Navisphere/bin/naviseccli';
my $hostfile = 'emc-arrays.txt';
my $storablefile = 'data/emc-inventory-dump.store';

my $storagehosts = get_array_list();

# getresume -all
# getsp
# ndu -list
# getagent
# getarrayuid
# getcrus
# getlun -crus -drivetype -capacity -owner -name -type -uid -bind
# getdisk
# getrg
# port -list -sp

# networkadmin -get (includes networkname, ipaddress, subnetmask, gateway)

my $storagegroups;

my $parsers = {
    'domain' =>
    {cmd => 'domain -list',
     parser =>
	 sub {
	     my $ret = shift;
	     my $ipaddr = shift;
	     my $node;
	     for my $line (@_) {
		 if ($line =~ /^Node:\s+(.*)/) {
		     $node = $1;
		 } elsif ($line =~ /^IP Address:\s+(.*)/) {
		     $ipaddr = $1;
		 } elsif ($line =~ /^([^:]+):\s+(.*)/) {
		     $ret->{$node}{$ipaddr}{$1} = $2;
		 }
	     }
	     return $ret;
     }
    },
    'getresume' =>
    {cmd => 'getresume -all',
     parser =>
	 sub {
	     my $ret = shift;
	     my $ipaddr = shift;
	     my $node = $ret;
	     for my $line (@_) {
		 if ($line =~ /^  SP ([A-Z])$/) {
		     $node = $ret->{'SP'}{$1} = {};
		 } elsif ($line =~ /^Storage Processor ([A-Z])/) {
		     $node = $ret->{'SP'}{$1};
		 } elsif ($line =~ /^  CPU Module/) {
		     $node = $node->{'CPU Module'} = {};
		 } elsif ($line =~ /^  I\/O Module\s+(\d+)/) {
		     $node = $node->{'I/O Module'}{$1} = {};
		 } elsif ($line =~ /^  I\/O Carrier\s+(\d+)/) {
		     $node = $node->{'I/O Carrier'}{$1} = {};
		 } elsif ($line =~ /^  Standby Power Supply/) {
		     $node = $node->{"Standby Power Supply"} = {};
		 } elsif ($line =~ /^Enclosure SPE/) {
		     $node = $ret->{'SPE'};
		 } elsif ($line =~ /^  Management Module\s+([A-Z])/) {
		     $node = $node->{'Management Module'}{$1} = {};
		 } elsif ($line =~ /^  Chassis\/Midplane/) {
		     $node = $node->{'Chassis/Midplane'} = {};
		 } elsif ($line =~ /^  Power ([A-Z])/) {
		     $node = $node->{'Power'}{$1} = {};
		 } elsif ($line =~ /^Bus\s+(\d+)\s+Enclosure\s+(\d+)/) {
		     $ret->{'DAE'}{"Bus $1 Enclosure $2"} = {}
		     unless defined $ret->{'DAE'}{"Bus $1 Enclosure $2"};
		     $node = $ret->{'DAE'}{"Bus $1 Enclosure $2"};
		 } elsif ($line =~ /^  LCC ([A-Z])/) {
		     $node = $node->{'LCC'}{$1} = {};
		 } elsif ($line =~ /^\s+([^:]+):\s+(.*)/) { # key: value
		     $node->{$1} = $2;
		 }
	     }
	     return $ret;
     }
    },
    'ndu' =>
    {cmd => 'ndu -list',
     parser =>
	 sub {
	     my $ret = shift;
	     my $ipaddr = shift;
	     my $package;
	     for my $line (@_) {
		 if ($line =~ /^Name of the software package:\s+(.*)/) {
		     $package = $1;
		 } elsif ($line =~ /^([^:]+):\s+(.*)/) {
		     $ret->{Package}{$package}{$1} = $2;
		 }
	     }
	     return $ret;
     }
    },
    'getcrus' =>
    {cmd => 'getcrus',
     parser =>
	 sub {
	     my $ret = shift;
	     my $ipaddr = shift;
	     for my $line (@_) {
		 if ($line =~ /^(Bus\s+\d+\s+Enclosure\s\d+)\s+([^ ]+)\s+([A-Z])\s([^:]+):\s+(.*)/) {
		     my $dae = $1;
		     my $subassy = $2;
		     my $ab = $3;
		     my $key = $4;
		     my $value = $5;
		     $dae =~ s/\s+/ /g; # collapse repeated whitespace
		     $ret->{DAE}{$dae}{$subassy}{$ab}{$key} = $value;
		 }
	     }
	     return $ret;
     }
    },
    'getlun' =>
    {cmd => 'getlun -crus -drivetype -capacity -owner -name -type -uid -bind -rg',
     parser =>
	 sub {
	     my $ret = shift;
	     my $ipaddr = shift;
	     my $lun;
	     for my $line (@_) {
		 if ($line =~ /^LOGICAL UNIT NUMBER (\d+)/) {
		     $lun = $1;
		 } elsif ($line =~ /^(Bus\s+\d+\s+Enclosure\s+\d+\s+Disk\s\d+)\s+(.*)/) {
		     my $diskid = $1;
		     my $status = $2;
		     $diskid =~ s/\s+/ /g; # removed repeated whitespace
		     $ret->{'LUN'}{$lun}{Disks}{$diskid} = $status;
		 } elsif ($line =~ /^([^:]+):\s+(.*)/) {
		     $ret->{'LUN'}{$lun}{$1} = $2;
		 } elsif ($line =~ /^(Name)\s+(.*)/) {
		     # lun name field doesn't use a colon separator character
		     $ret->{'LUN'}{$lun}{$1} = $2;
		 }
	     }
	     return $ret;
     }
    },
    'getarrayuid' =>
    {cmd => 'getarrayuid',
     parser =>
	 sub {
	     my $ret = shift;
	     my $ipaddr = shift;
	     return undef if $#_ < 3;
	     my @fields = split(/\s+/, $_[2]);
	     $ret->{'Array UID'} = $fields[1];
	     return $ret;
     }
    },
    'getagent' =>
    {cmd => 'getagent',
     parser =>
	 sub {
	     my $ret = shift;
	     my $ipaddr = shift;
	     for my $line (@_) {
		 if ($line =~ /^([^:]+):\s+(.*)/) {
		     my $key = $1;
		     my $value = $2;
		     next if ($key eq 'SP Identifier');
		     next if ($key eq 'SP Memory');
		     next if ($key eq 'SCSI Id');
		     next if ($key eq 'Name');
		     $ret->{$key} = $value;
		 }
	     }
	     return $ret;
     }
    },
    'getsp' =>
    {cmd => 'getsp',
     parser =>
	 sub {
	     my $ret = shift;
	     my $ipaddr = shift;
	     my $sp;
	     for my $line (@_) {
		 if ($line =~ /^SP ([A-Z])/) {
		     $sp = $1;
		 } elsif ($line =~ /^([^:]+):\s+(.*)/) {
		     my $key = $1;
		     my $value = $2;
		     $ret->{'SP'}{$sp}{$key} = $value;
		 }
	     }
	     return $ret;
     }
    },
    'ports' =>
    {cmd => 'port -list -sp',
     parser =>
	 sub {
	     my $ret = shift;
	     my $ipaddr = shift;
	     my $sp;
	     my $port;
	     for my $line (@_) {
		 if ($line =~ /^SP Name:\s+SP ([A-Z])/) {
		     $sp = $1;
		 } elsif ($line =~ /^SP Port ID:\s+(.*)/) {
		     $port = $1;
		 } elsif ($line =~ /^([^:]+):\s+(.*)/) {
		     my $key = $1;
		     my $value = $2;
		     $ret->{'SPPORTS'}{$sp}{$port}{$key} = $value;
		 }
	     }
	     return $ret;
     }
    },
    'getdisk' =>
    {cmd => 'getdisk',
     parser =>
	 sub {
	     my $ret = shift;
	     my $ipaddr = shift;
	     my $shelf;
	     my $disk;
	     my $diskid;
	     for my $line (@_) {
		 if ($line =~ /^(Bus\s+\d+\s+Enclosure\s+\d+)\s+Disk\s+(\d+)$/) {
		     $shelf = $1;
		     $disk = $2;
		     $shelf =~ s/\s+/ /g; # collapse repeat whitespace
		 } elsif ($line =~ /^([^:]+):\s*(.*)/) {
		     my $key = $1;
		     my $value = $2;
		     next if $key eq 'Idle Ticks';
		     next if $key eq 'Busy Ticks';
		     $ret->{'DAE'}{$shelf}{'Disk'}{$disk}{$key} = $value;
		 }
	     }
	     return $ret;
     }
    },
    'getrg' =>
    {cmd => 'getrg',
     parser =>
	 sub {
	     my $ret = shift;
	     my $ipaddr = shift;
	     my $rg;
	     my $rgtype;
	     my $rawblocks;
	     my $logicalblocks;
	     my $freeblocks;

	     for my $line (@_) {
		 if ($line =~ /^RaidGroup ID:\s+(.*)$/) {
		     $rg = $1;
		     $ret->{raidgroups}{$rg} = {};
		 } elsif ($line =~ /^RaidGroup Type:\s+(.*)$/) {
		     $rgtype = $1;
		     $ret->{raidgroups}{$rg}{raidtype} = $rgtype;
		 } elsif ($line =~ /^Raw Capacity \(Blocks\):\s+(.*)$/) {
		     $rawblocks = $1;
		     $ret->{raidgroups}{$rg}{rawblocks} = $rawblocks;
		 } elsif ($line =~ /^Logical Capacity \(Blocks\):\s+(.*)$/) {
		     $logicalblocks = $1;
		     $ret->{raidgroups}{$rg}{logicalblocks} = $logicalblocks;
		 } elsif ($line =~ /^Free Capacity \(Blocks,non-contiguous\):\s+(.*)$/) {
		     $freeblocks = $1;
		     $ret->{raidgroups}{$rg}{freeblocks} = $freeblocks;
		 }
	     }

	     return $ret;
     }
    },
    'storagegroup' =>
    {cmd => 'storagegroup -list -host',
     parser =>
	 sub {
	     my $ret = shift;
	     my $ipaddr = shift;
	     my $sg;
	     my $sguid;
	     my $hbauid;
	     my $sp;
	     my $spport;
	     for my $line (@_) {
		 if ($line =~ /^Storage Group Name:\s+(.*)/) {
		     $sg = $1;
		 } elsif ($line =~ /^Storage Group UID:\s+(.*)/) {
		     $sguid = $1;
		 } elsif ($line =~ /^  ([0-9A-F][0-9A-F]:[0-9A-F][0-9A-F]:[^ ]+)\s+(SP .)\s+(\d+)/) {
		     # HB UID, Storage Processor, Storage Processor Port
		     $hbauid = $1;
		     $sp = $2;
		     $spport = $3;
		 } elsif ($line =~ /^Host name:\s+([^ ]+)/) {
		     my $host = $1;
		     $storagegroups->{$sg}{$ipaddr}{$host}++;
		     $ret->{'SG'}{$sg}{hosts}{$host}{hbauid} = $hbauid;
		     $ret->{'SG'}{$sg}{hosts}{$host}{sp}{$sp} = $spport;
		 } elsif ($line =~ /^\s+(\d+)\s+(\d+)$/) {
		     # HLU/ALU mapping
		     my $hlu = $1;
		     my $alu = $2;
		     $ret->{'SG'}{$sg}{lu}{$hlu} = $alu;
		 }
	     }
	     return $ret;
     }
    },
};

###############################################################################

# my @ipaddrs = sort(get_domain_hosts(@domain_masters));
my @ipaddrs = sort keys %$storagehosts;
my $data = get_data(@ipaddrs);
nstore $data, $storablefile;
exit 0;

###############################################################################
# The main loop.

sub get_data {
    my @cmdtags = (qw(getresume getsp ndu getagent getarrayuid getcrus getlun getdisk getrg ports));
    # my @cmdtags = (qw(storagegroup));
    my $data = {};
    for my $ipaddr (@_) {
	warn "[$ipaddr]\n";
	$data->{$ipaddr} = {};
	$data->{$ipaddr}{Name} = $storagehosts->{$ipaddr}{Name};
	$data->{$ipaddr}{Model} = $storagehosts->{$ipaddr}{Model};
	$data->{$ipaddr}{Location} = $storagehosts->{$ipaddr}{Location};
	for my $cmdtag (@cmdtags) {
	    my @lines = run_naviseccli($ipaddr, $parsers->{$cmdtag}{cmd});
	    last unless @lines;
	    &{$parsers->{$cmdtag}{parser}}($data->{$ipaddr}, $ipaddr, @lines);
	}
    }
    return $data;
}

###############################################################################
# Runs naviseccli with specified options and returns a list of the
# lines returned by naviseccli without EOL characters at the end of
# each line.

sub run_naviseccli {
    my $ipaddr = shift;
    my $cmd = shift;

    my @ret;

    my $in;

    unless (open($in, "$naviseccli -h $ipaddr $cmd |")) {
	warn "can't run naviseccli: $!\n";
	return ();
    }
    while (<$in>) {
	chomp;
	s/\r$//;		# dos carriage returns :(
	s/\s+$//;		# delete trailing whitespace
	if (/^Authentication failed/) {
	    @ret = ();
	    warn "Can't authenticate to $ipaddr\n";
	    last;
	} elsif (/^Exception:/) {
	    @ret = ();
	    warn "$_\n";
	    last;
	}
	push @ret, $_;
    }
    unless (close($in)) {
	warn "$naviseccli returned failure for $ipaddr\n";
	return ();
    }

    return @ret;
}

###############################################################################
# Read a text files containing the arrays to query and returns a hash
# with the information from the file. This will eventually be replaced
# with a better mechanism, such as using storage domains.

sub get_array_list {
    my $arrays;

    open(my $in, '<', $hostfile)
	or die "can't open $hostfile: $!\n";
    my $header = <$in>;
    while (<$in>) {
	chomp;
	s/\r$//;		# dos carriage returns :(
	next if /^#/;		# ignore comment lines
	next if /^\s*$/;	# ignore empty lines

	my ($name, $model, $location, $ipaddr, $secipaddr, $serial) = split(/\t/);

	$arrays->{$ipaddr}{Name} = $name;
	$arrays->{$ipaddr}{Model} = $model;
	$arrays->{$ipaddr}{Location} = $location;
    }
    close $in;

    return $arrays;
}

###############################################################################
# Contact an EMC array and get a list of IP addresses for nodes in the
# associate storage domain.

sub get_domain_hosts {
    my @addrs;
    for my $host (@_) {
	my $data = {};
	my @lines = run_naviseccli($host, $parsers->{'domain'}{cmd});
	next unless @lines;
	&{$parsers->{'domain'}{parser}}($data, $host, @lines);
	# The domain list returns node pairs, so we just pick the first ip
	# addr from each node.
	for my $node (keys %$data) {
	    my @ipaddrs = sort keys %{$data->{$node}};
	    my $ipaddr = $ipaddrs[0];
	    $ipaddr =~ s/ .*//;
	    push @addrs, $ipaddr;
	}
    }
    return @addrs;
}

###############################################################################
