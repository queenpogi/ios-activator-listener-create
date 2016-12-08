use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'iOS::Activator::Listener::Create',
    AUTHOR              => 'Zdenek Bohunek <zed448@icloud.com>',
    VERSION_FROM        => 'lib/iOS/Activator/Listener/Create.pm',
    ABSTRACT_FROM       => 'lib/iOS/Activator/Listener/Create.pm',
    PL_FILES            => {},
    'EXE_FILES'         => ['create-activator-listener'],
    PREREQ_PM => {
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'iOS-Activator-Listener-Create-*' },
);
