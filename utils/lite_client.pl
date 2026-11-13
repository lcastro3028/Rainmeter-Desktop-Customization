package AtomicProcessor;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 30 }, $class;
}

sub dispatch_processor {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 30) % 997;
    }
    return $value;
}

print AtomicProcessor->new->dispatch_processor(30), "\n";
1;
