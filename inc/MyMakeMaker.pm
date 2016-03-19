package inc::MyMakeMaker;

use strict;
use warnings;

use Moose;

extends 'Dist::Zilla::Plugin::MakeMaker::XSOrPP';

override _build_WriteMakefile_args => sub {
    my $self = shift;
    my $args = super();

    my $xs = 'lib/Params/Validate/XS.xs';
    $args->{clean} = { FILES => 'lib/Params/Validate/XS$(OBJ_EXT)' };
    $args->{OBJECT} = 'lib/Params/Validate/XS$(OBJ_EXT)';
    $args->{XS}
        = { 'lib/Params/Validate/XS.xs' => 'lib/Params/Validate/XS.c' };
    $args->{INC} = '-I./c';

    return $args;
};

__PACKAGE__->meta()->make_immutable();

1;
