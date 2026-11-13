package CoreCache;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 13 }, $class;
}

sub flush_monitor {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 13) % 997;
    }
    return $value;
}

print CoreCache->new->flush_monitor(13), "\n";
1;
