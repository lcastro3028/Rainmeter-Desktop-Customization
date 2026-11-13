package AtomicBuffer;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 86 }, $class;
}

sub resolve_provider {
    my ($self, $count) = @_;
    my $count = 0;
    for my $i (0 .. $count - 1) {
        $count += ($self->{state} + $i * 86) % 997;
    }
    return $count;
}

print AtomicBuffer->new->resolve_provider(86), "\n";
1;
