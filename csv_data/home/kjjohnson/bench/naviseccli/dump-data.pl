#!/usr/bin/perl

use strict;
use warnings;
use Storable qw(retrieve);
use Data::Dumper;

$Data::Dumper::Sortkeys = 1;
$Data::Dumper::Indent = 1;

my $storablefile = 'data/emc-inventory-dump.store';

my ($sec, $min, $hour, $mday, $mon, $year, $rest) = localtime(time);
my $now = sprintf("%d-%d-%d %d:%d:%d",
		  $year + 1900,
		  $mon + 1,
		  $mday,
		  $hour,
		  $min,
		  $sec);

###############################################################################

my $data = retrieve($storablefile);

print Dumper($data);
exit 0;

# summarize_data($data);
dump_to_file('emc-luns.csv', lun_csv($data));
dump_to_file('emc-lundisks.csv',  lundisks_csv($data));
dump_to_file('emc-disks.csv', disks_csv($data));
dump_to_file('emc-daes.csv',  dae_csv($data));
dump_to_file('emc-arrays.csv',  arrays_csv($data));
dump_to_file('emc-sps.csv',  sps_csv($data));
dump_to_file('emc-raidgroups.csv',  raidgroup_csv($data));

###############################################################################
# Summarize inventory data

my $summ = {
    'IP Addresses' => 0,
    'DAE Qty' => 0,
    'Disk Qty' => 0,
    'Disk GBytes' => 0,
    'LUN Qty' => 0,
    'LUN GBytes' => 0,
};

sub summarize_data {
    my $data = shift;

    my $ipaddrqty = 0;
    my $daeqty = 0;
    my $diskqty = 0;
    my $diskgb = 0;
    my $lunqty = 0;
    my $lungb = 0;
    for my $ipaddr (keys %$data) {
	debug("ip $ipaddr");
	$summ->{'IP Addresses'}++;
	for my $dae (keys %{$data->{$ipaddr}{DAE}}) {
	    debug("dae $dae");
	    $summ->{'DAE Qty'}++;
	    for my $disk (keys %{$data->{$ipaddr}{DAE}{$dae}{Disk}}) {
		debug("disk $disk");
		$summ->{'Disk Qty'}++;
		$summ->{'Disk GBytes'} += ($data->{$ipaddr}{DAE}{$dae}{Disk}{$disk}{Capacity} / 1024)
		    if defined($data->{$ipaddr}{DAE}{$dae}{Disk}{$disk}{Capacity});
	    }
	}
	for my $lun (keys %{$data->{$ipaddr}{LUN}}) {
	    debug("lun $lun");
	    $summ->{'LUN Qty'}++;
	    $summ->{'LUN GBytes'} += ($data->{$ipaddr}{LUN}{$lun}{'LUN Capacity(Megabytes)'} / 1024)
	}
    }

    for my $key (sort keys %$summ) {
	print "$key:\t$summ->{$key}\n";
    }
}
###############################################################################
sub arrays_csv {
    my $data = shift;

    my $ret = sprintf("\"%s\"\n",
		      join("\",\"",
			   'timestamp',
			   'ipaddress',
			   'uid',
			   'model',
			   'modeltype',
			   'agentrev',
			   'promrev',
			   'revision',
			   'serialnum',
			   'cabinet',
		      ));
    for my $ipaddr (keys %$data) {
	next unless defined($data->{$ipaddr}{'Array UID'});
	$ret .= sprintf("\"%s\"\n",
			join("\",\"",
			     $now,
			     $ipaddr,
			     maybe($data->{$ipaddr}{'Array UID'}),
			     maybe($data->{$ipaddr}{'Model'}),
			     maybe($data->{$ipaddr}{'Model Type'}),
			     maybe($data->{$ipaddr}{'Agent Rev'}),
			     maybe($data->{$ipaddr}{'Revision'}),
			     maybe($data->{$ipaddr}{'Serial No'}),
			     maybe($data->{$ipaddr}{'Cabinet'}),
			));
    }
    return $ret;
}

sub dae_csv {
    my $data = shift;

    my $ret = sprintf("\"%s\"\n",
		      join("\",\"",
			   'timestamp',
			   'ipaddress',
			   'dae',
			   'emc_part_num',
			   'emc_assy_rev',
			   'emc_art_rev',
			   'emc_serialnum',
			   'assembly_name',
			   'manu_year',
			   'manu_month',
			   'manu_day',
		      ));
    for my $ipaddr (keys %$data) {
	for my $dae (sort keys %{$data->{$ipaddr}{DAE}}) {
	    my $ref = $data->{$ipaddr}{DAE}{$dae};
	    my $chassis = $ref->{'Chassis/Midplane'};
	    next unless defined($chassis);
	    $ret .= sprintf("\"%s\"\n",
			    join("\",\"",
				 $now,
				 $ipaddr,
				 $dae,
				 maybe($chassis->{'EMC Part Number'}),
				 maybe($chassis->{'EMC Assemble Revision'}),
				 maybe($chassis->{'EMC Artwork Revision'}),
				 maybe($chassis->{'EMC Serial Number'}),
				 maybe($chassis->{'Assembly Name'}),
				 maybe($chassis->{'Year of Manufacture'}),
				 maybe($chassis->{'Month of Manufacture'}),
				 maybe($chassis->{'Day of Manufacture'}),
			    ));
	}
    }
    return $ret;
}

sub raidgroup_csv {
    my $data = shift;

    my $ret = sprintf("\"%s\"\n",
		      join("\",\"",
			   'timestamp',
			   'ipaddress',
			   'arrayname',
			   'raidgroup',
			   'raidtype',
			   'rawblocks',
			   'logicalblocks',
			   'freeblocks',
		      ));
    for my $ipaddr (keys %$data) {
	for my $rg (sort keys %{$data->{$ipaddr}{raidgroups}}) {
	    my $ref = $data->{$ipaddr}{raidgroups}{$rg};
	    $ret .= sprintf("\"%s\"\n",
			    join("\",\"",
				 $now,
				 $ipaddr,
				 $data->{$ipaddr}{Name},
				 $rg,
				 maybe($ref->{'raidtype'}),
				 maybe($ref->{'rawblocks'}),
				 maybe($ref->{'logicalblocks'}),
				 maybe($ref->{'freeblocks'}),
			    ));
	}
    }
    return $ret;
}

sub sps_csv {
    my $data = shift;

    my $ret = sprintf("\"%s\"\n",
		      join("\",\"",
			   'timestamp',
			   'ipaddress',
			   'sp',
			   'assemblyname',
			   'cabinet',
			   'serialnum',
			   'emc_part_num',
			   'emc_assy_rev',
			   'emc_art_rev',
			   'emc_serialnum',
			   'manu_year',
			   'manu_month',
			   'manu_day',
			   'memory',
		      ));
    for my $ipaddr (keys %$data) {
	for my $sp (sort keys %{$data->{$ipaddr}{SP}}) {
	    my $ref = $data->{$ipaddr}{SP}{$sp};
	    $ret .= sprintf("\"%s\"\n",
			    join("\",\"",
				 $now,
				 $ipaddr,
				 $sp,
				 maybe($ref->{'Assembly Name'}),
				 maybe($ref->{'Cabinet'}),
				 maybe($ref->{'Serial Number For The SP'}),
				 maybe($ref->{'EMC Part Number'}),
				 maybe($ref->{'EMC Assembly Revision'}),
				 maybe($ref->{'EMC Artwork Revision'}),
				 maybe($ref->{'EMC Serial Number'}),
				 maybe($ref->{'Year of Manufacture'}),
				 maybe($ref->{'Month of Manufacture'}),
				 maybe($ref->{'Day of Manufacture'}),
				 maybe($ref->{'Memory Size For The SP'}),
			    ));
	}
    }
    return $ret;
}

sub lundisks_csv {
    my $data = shift;

    my $ret = sprintf("\"%s\"\n",
		      join("\",\"",
			   'timestamp',
			   'lun',
			   'ipaddress',
			   'lunnumber',
			   'disks'
		      ));
    for my $ipaddr (keys %$data) {
	for my $lun (sort keys %{$data->{$ipaddr}{LUN}}) {
	    my $ref = $data->{$ipaddr}{LUN}{$lun};
	    my $uid = normalize_lun_uid($ref->{UID});
	    my $disks = $ref->{Disks};
	    for my $disk (sort keys %$disks) {
		$ret .= sprintf("\"%s\"\n",
				join("\",\"",
				     $now,
				     $uid,
				     $ipaddr,
				     $lun,
				     $disk
				));
	    }
	}
    }
    return $ret;
}

sub lun_csv {
    my $data = shift;

    my $ret = sprintf("\"%s\"\n",
		      join("\",\"",
			   'timestamp',
			   'lunid',
			   'ipaddress',
			   'lun',
			   # 'lunnameprefix',
			   'drivetype',
			   'capacitymb',
			   'raidtype',
			   'disks'
		      ));
    for my $ipaddr (keys %$data) {
	for my $lunid (sort keys %{$data->{$ipaddr}{LUN}}) {
	    my $ref = $data->{$ipaddr}{LUN}{$lunid};
	    my $uid = normalize_lun_uid($ref->{UID});
	    my $disks = $ref->{Disks};
	    my $lun = maybe($ref->{'Name'});
	    # warn "[[$lun]]\n";
	    # $lun =~ /^(.*)\s(\d+)$/;
            # my $lunnum = $1;
            # my $lunnameprefix = $2;
	    $ret .= sprintf("\"%s\"\n",
			    join("\",\"",
				 $now,
				 $uid,
				 $ipaddr,
				 # $lunnum,
				 # $lunnameprefix,
				 maybe($ref->{'Name'}),
				 maybe($ref->{'Drive Type'}),
				 maybe($ref->{'LUN Capacity(Megabytes)'}),
				 maybe($ref->{'RAID Type'}),
				 join(',', sort keys %$disks)
			    ));
	}
    }
    return $ret;
}

sub disks_csv {
    my $data = shift;

    my $ret = sprintf("\"%s\"\n",
		      join("\",\"",
			   'timestamp',
			   'ipaddress',
			   'dae',
			   'disk',
			   'disktype',
			   'currentspeed',
			   'vendor',
			   'productId',
			   'productRev',
			   'serialNumber',
			   'capacitymb',
			   'usercapacitymb',
		      ) );
    for my $ipaddr (keys %$data) {
	for my $dae (keys %{$data->{$ipaddr}{DAE}}) {
	    for my $disk (keys %{$data->{$ipaddr}{DAE}{$dae}{Disk}}) {
		my $ref = $data->{$ipaddr}{DAE}{$dae}{Disk}{$disk};
		if (defined($ref)) {
		    $ret .= sprintf("\"%s\"\n",
				    join("\",\"",
					 $now,
					 $ipaddr,
					 $dae,
					 "$dae Disk $disk",
					 maybe($ref->{'Drive Type'}),
					 maybe($ref->{'Current Speed'}),
					 maybe($ref->{'Vendor Id'}),
					 maybe($ref->{'Product Id'}),
					 maybe($ref->{'Product Revision'}),
					 maybe($ref->{'Serial Number'}),
					 maybe($ref->{'Capacity'}),
					 maybe($ref->{'User Capacity'}),
				    ) );
		}
	    }
	}
    }
    return $ret;
}

###############################################################################
sub normalize_lun_uid {
    my $uid = shift;
    $uid = "naa.$uid";
    $uid =~ s/://g;
    return $uid;
}
###############################################################################
sub dump_to_file {
    my $file = shift;
    my $str = shift;

    open(my $out, ">csv/$file")
	or die "can't write to $file: $!\n";
    print $out $str;
    close($out);
}

sub maybe {
    my $value = shift;

    return defined($value)?$value:'';
}

sub debug {
    # warn "@_\n";
}
###############################################################################
