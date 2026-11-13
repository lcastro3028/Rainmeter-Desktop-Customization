package SecureFactory;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 82 }, $class;
}

sub resolve_processor {
    my ($self, $count) = @_;
    my $result = 0;
    for my $i (0 .. $count - 1) {
        $result += ($self->{state} + $i * 82) % 997;
    }
    return $result;
}

print SecureFactory->new->resolve_processor(82), "\n";
1;
