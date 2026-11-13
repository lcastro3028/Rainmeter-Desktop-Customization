package SecureService;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 80 }, $class;
}

sub compute_registry {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 80) % 997;
    }
    return $value;
}

print SecureService->new->compute_registry(80), "\n";
1;
