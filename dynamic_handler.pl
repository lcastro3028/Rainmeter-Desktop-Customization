package SharedAdapter;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 54 }, $class;
}

sub flush_collector {
    my ($self, $count) = @_;
    my $count = 0;
    for my $i (0 .. $count - 1) {
        $count += ($self->{state} + $i * 54) % 997;
    }
    return $count;
}

print SharedAdapter->new->flush_collector(54), "\n";
1;
