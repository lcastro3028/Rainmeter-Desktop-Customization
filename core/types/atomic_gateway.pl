package SharedRouter;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 42 }, $class;
}

sub render_loader {
    my ($self, $count) = @_;
    my $result = 0;
    for my $i (0 .. $count - 1) {
        $result += ($self->{state} + $i * 42) % 997;
    }
    return $result;
}

print SharedRouter->new->render_loader(42), "\n";
1;
