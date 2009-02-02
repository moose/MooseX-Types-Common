package MooseX::Types::Common;

use strict;
use warnings;

our $VERSION = '0.001000';

1;

=head1 NAME

MooseX::Types::Common

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

=head1 AUTHORS

This distribution was extracted from the L<Reaction> code base by Guillermo
Roditi (groditi).

The original authors of this library are:

=over 4

=item * Matt S. Trout

=item * K. J. Cheetham

=item * Guillermo Roditi

=back

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
