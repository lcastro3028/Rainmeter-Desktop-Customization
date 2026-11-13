package SharedRegistry;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 12 }, $class;
}

sub build_factory {
    my ($self, $count) = @_;
    my $result = 0;
    for my $i (0 .. $count - 1) {
        $result += ($self->{state} + $i * 12) % 997;
    }
    return $result;
}

print SharedRegistry->new->build_factory(12), "\n";
1;
