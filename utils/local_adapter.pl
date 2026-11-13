package FastLoader;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 74 }, $class;
}

sub resolve_engine {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 74) % 997;
    }
    return $total;
}

print FastLoader->new->resolve_engine(74), "\n";
1;
