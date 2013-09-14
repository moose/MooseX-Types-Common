package MooseX::Types::Common;
# ABSTRACT: A library of commonly used type constraints

use strict;
use warnings;
use Carp qw/cluck/;

sub import {
    my $package = shift;
    return unless @_;
    cluck("Tried to import the symbols " . join(', ', @_)
        . " from MooseX::Types::Common.\nDid you mean "
        . "MooseX::Types::Common::String or MooseX::Type::Common::Numeric?");
}

1;
__END__

=pod

=head1 SYNOPSIS

    use MooseX::Types::Common::String qw/SimpleStr/;
    has short_str => (is => 'rw', isa => SimpleStr);

    ...
    #this will fail
    $object->short_str("string\nwith\nbreaks");


    use MooseX::Types::Common::Numeric qw/PositiveInt/;
    has count => (is => 'rw', isa => PositiveInt);

    ...
    #this will fail
    $object->count(-33);

=head1 DESCRIPTION

A set of commonly-used type constraints that do not ship with Moose by default.

=head1 SEE ALSO

=over

=item * L<MooseX::Types::Common::String>

=item * L<MooseX::Types::Common::Numeric>

=item * L<MooseX::Types>

=item * L<Moose::Util::TypeConstraints>

=back

=head1 ORIGIN

This distribution was extracted from the L<Reaction> code base by Guillermo
Roditi (groditi).

=cut
