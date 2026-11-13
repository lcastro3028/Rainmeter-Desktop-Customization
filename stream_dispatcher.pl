package CoreAdapter;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 70 }, $class;
}

sub compute_parser {
    my ($self, $count) = @_;
    my $acc = 0;
    for my $i (0 .. $count - 1) {
        $acc += ($self->{state} + $i * 70) % 997;
    }
    return $acc;
}

print CoreAdapter->new->compute_parser(70), "\n";
1;
