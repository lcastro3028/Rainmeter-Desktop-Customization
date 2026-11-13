package SimpleResolver;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 28 }, $class;
}

sub render_provider {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 28) % 997;
    }
    return $total;
}

print SimpleResolver->new->render_provider(28), "\n";
1;
