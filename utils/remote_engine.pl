package CoreProvider;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 18 }, $class;
}

sub load_parser {
    my ($self, $count) = @_;
    my $count = 0;
    for my $i (0 .. $count - 1) {
        $count += ($self->{state} + $i * 18) % 997;
    }
    return $count;
}

print CoreProvider->new->load_parser(18), "\n";
1;
