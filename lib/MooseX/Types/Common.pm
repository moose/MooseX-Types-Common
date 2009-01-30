package MooseX::Types::Common;

use strict;
use warnings;

our $VERSION = '0.001000';

use MooseX::Types -declare => [
  qw(SimpleStr NonEmptySimpleStr Password StrongPassword NonEmptyStr
     PositiveNum PositiveInt NegativeNum NegativeInt SingleDigit)
];

use MooseX::Types::Moose qw/Str Num Int Object/;

subtype SimpleStr,
  as Str,
  where { (length($_) <= 255) && ($_ !~ m/\n/) },
  message { "Must be a single line of no more than 255 chars" };

subtype NonEmptySimpleStr,
  as SimpleStr,
  where { length($_) > 0 },
  message { "Must be a non-empty single line of no more than 255 chars" };

# XXX duplicating constraint msges since moose only uses last message
subtype Password,
  as NonEmptySimpleStr,
  where { length($_) > 3 },
  message { "Must be between 4 and 255 chars" };

subtype StrongPassword,
  as Password,
  where { (length($_) > 7) && (m/[^a-zA-Z]/) },
  message {"Must be between 8 and 255 chars, and contain a non-alpha char" };

subtype NonEmptyStr,
  as Str,
  where { length($_) > 0 },
  message { "Must not be empty" };

subtype PositiveNum,
  as Num,
  where { $_ >= 0 },
  message { "Must be a positive number" };

subtype PositiveInt,
  as Int,
  where { $_ >= 0 },
  message { "Must be a positive integer" };

subtype NegativeNum,
  as Num,
  where { $_ <= 0 },
  message { "Must be a negative number" };

subtype NegativeInt,
  as Int,
  where { $_ <= 0 },
  message { "Must be a negative integer" };

subtype SingleDigit,
  as PositiveInt,
  where { $_ <= 9 },
  message { "Must be a single digit" };

1;

=head1 NAME

MooseX::Types::Common

=head1 SYNOPSIS

    use MooseX::Types::Common qw/SimpleStr/;
    has short_str => (is => 'rw', isa => SimpleStr);

    ...
    #this will fail
    $object->short_str("string\nwith\nbreaks");

=head1 DESCRIPTION

A set of commonly-used type constraints that do not ship with Moose by default.

=over

=item * SimpleStr

A Str with no new-line characters.

=item * NonEmptySimpleStr

Does what it says on the tin.

=item * Password

=item * StrongPassword

=item * NonEmptyStr

=item * PositiveNum

=item * PositiveInt

=item * NegativeNum

=item * Int

=item * SingleDigit

=back

=head1 SEE ALSO

=over

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
