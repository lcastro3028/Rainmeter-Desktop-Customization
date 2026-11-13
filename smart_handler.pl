package FastEngine;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 39 }, $class;
}

sub dispatch_adapter {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 39) % 997;
    }
    return $total;
}

print FastEngine->new->dispatch_adapter(39), "\n";
1;
