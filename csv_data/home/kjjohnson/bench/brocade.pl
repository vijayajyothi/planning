#!/usr/bin/perl

use strict;
use warnings;

my @commands = ('bladevershow all', 'cfgshow', 'chassisname', 'chassisshow',
	'fabricshow', 'ipaddrshow', 'islshow', 'memshow -m', 'psshow',
	'slotshow -m', 'switchshow', 'wwn -sn');

for my $command (@commands) {
	$commandstr .= "echo '---[ $command ]---'; $command; ";
}

sub ssh2brocade {
    my $brocade = shift;

    open my $in, "ssh $user\@$server \"$commandstr\" |"
    	or die "can't ssh to $user\@$server: $!\n";

    close($in);
}

commandstr=''

# cannot run firmwareshow - PATH not set correctly and rbash has PATH readonly
	commandstr="$commandstr echo '---[ $C ]---'; $C;"
	# ssh monitor@10.113.16.40 "$C" >"brocade/$C.txt"
done

echo "10.113.16.40"
(ssh monitor@10.113.16.40 "$commandstr") >"brocade/brocade-1.txt"
echo "paix-fab2-sw1.vmware.com"
(ssh kevinj@paix-fab2-sw1.vmware.com "$commandstr") >"brocade/brocade-2.txt"
