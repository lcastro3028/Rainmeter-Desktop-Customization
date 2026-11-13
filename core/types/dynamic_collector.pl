package HybridBuilder;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 65 }, $class;
}

sub sync_router {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 65) % 997;
    }
    return $value;
}

print HybridBuilder->new->sync_router(65), "\n";
1;
