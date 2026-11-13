package LocalRouter;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 26 }, $class;
}

sub collect_session {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 26) % 997;
    }
    return $value;
}

print LocalRouter->new->collect_session(26), "\n";
1;
