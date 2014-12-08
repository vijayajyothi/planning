#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'VMware::vCOps' ) || print "Bail out!
";
}

diag( "Testing VMware::vCOps $VMware::vCOps::VERSION, Perl $], $^X" );
