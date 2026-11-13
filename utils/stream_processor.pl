package AsyncHandler;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 43 }, $class;
}

sub sync_buffer {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 43) % 997;
    }
    return $total;
}

print AsyncHandler->new->sync_buffer(43), "\n";
1;
