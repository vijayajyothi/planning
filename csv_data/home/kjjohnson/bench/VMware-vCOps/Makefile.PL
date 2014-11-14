use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'VMware::vCOps',
    AUTHOR              => q{Kevin Johnson <kjjohnson@vmware.com>},
    VERSION_FROM        => 'lib/VMware/vCOps.pm',
    ABSTRACT_FROM       => 'lib/VMware/vCOps.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'VMware-vCOps-*' },
);
