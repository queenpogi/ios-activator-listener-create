package iOS::Activator::Listener::Create;

use 5.010;
use warnings;
use strict;

=head1 NAME

iOS::Activator::Listener::Create - create Activator listeners

=cut

require Exporter;
our @ISA = qw< Exporter >;
our @EXPORT_OK = qw( activator_listener );
our $VERSION = '0.01';

my $cache = '/var/mobile/Library/Caches/libactivator.plist';
my $t = time();

sub activatorKeys {
    my($cmd, $type) = @_;

    my $name = lc $cmd; $name =~ s/([a-z].*?)(\ .*)/$1/; $name .= $t;
    my $key = '.run.'; $key = '.show.' if $type eq 'Message';

    my $listener = {
        uuid    =>  'libactivator.' . lc $type . $key . $name,
        title   =>  "\"$cmd\"", 
        type    =>  'LA' . $type . 'Listeners',
        action  =>  sub { 
            $cmd = $cmd . ' && activator send libactivator.message.show.' . $name;
            return 'ok' if $type eq 'Message';
            return $cmd if $type eq 'Command';
        },
    };
};

sub activator_listener {
    my $command = shift;
    for(qw< Command Message >){
        my $a =  activatorKeys("$command", $_);
        my $key = lc $_;

        if(`activator get $a->{type}` eq $a->{uuid}){ return }
        system("plutil -key $a->{type} -dict $cache") unless `activator get $a->{type}`;
        system("plutil -key $a->{type} -key $a->{uuid} -dict $cache");
        system("plutil -key $a->{type} -key $a->{uuid} -key title -value $a->{title} $cache");
        system("plutil -key $a->{type} -key $a->{uuid} -key $key -value \"$a->{action}->()\" $cache");
        system("plutil -key $a->{type} -key $a->{uuid} -key banner -value 1 $cache") if /Message/;
    };
}
