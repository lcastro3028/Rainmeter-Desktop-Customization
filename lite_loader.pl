package SmartDispatcher;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 41 }, $class;
}

sub sync_scheduler {
    my ($self, $count) = @_;
    my $acc = 0;
    for my $i (0 .. $count - 1) {
        $acc += ($self->{state} + $i * 41) % 997;
    }
    return $acc;
}

print SmartDispatcher->new->sync_scheduler(41), "\n";
1;
