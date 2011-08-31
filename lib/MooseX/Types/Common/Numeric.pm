package MooseX::Types::Common::Numeric;

use strict;
use warnings;

our $VERSION = '0.001001';

use MooseX::Types -declare => [
  qw(PositiveNum PositiveInt NegativeNum NegativeInt SingleDigit)
];

use MooseX::Types::Moose qw/Num Int/;

subtype PositiveNum,
  as Num,
  where { $_ > 0 },
  message { "Must be a positive number" },
    ( $Moose::VERSION >= 2.0200
        ? inline_as {
            $_[0]->parent()->_inline_check( $_[1] ) . ' && '
                . qq{ ($_[1] > 0) };
        }
        : ()
    );

subtype PositiveInt,
  as Int,
  where { $_ > 0 },
  message { "Must be a positive integer" },
    ( $Moose::VERSION >= 2.0200
        ? inline_as {
            $_[0]->parent()->_inline_check( $_[1] ) . ' && '
                . qq{ ($_[1] > 0) };
        }
        : ()
    );

subtype NegativeNum,
  as Num,
  where { $_ < 0 },
  message { "Must be a negative number" },
    ( $Moose::VERSION >= 2.0200
        ? inline_as {
            $_[0]->parent()->_inline_check( $_[1] ) . ' && '
                . qq{ ($_[1] < 0) };
        }
        : ()
    );

subtype NegativeInt,
  as Int,
  where { $_ < 0 },
  message { "Must be a negative integer" },
    ( $Moose::VERSION >= 2.0200
        ? inline_as {
            $_[0]->parent()->_inline_check( $_[1] ) . ' && '
                . qq{ ($_[1] < 0) };
        }
        : ()
    );

subtype SingleDigit,
  as PositiveInt,
  where { $_ <= 9 },
  message { "Must be a single digit" },
    ( $Moose::VERSION >= 2.0200
        ? inline_as {
            $_[0]->parent()->_inline_check( $_[1] ) . ' && '
                . qq{ ($_[1] <= 9) };
        }
        : ()
    );

1;

__END__;

=head1 NAME

MooseX::Types::Common::Numeric - Commonly used numeric types

=head1 SYNOPSIS

    use MooseX::Types::Common::Numeric qw/PositiveInt/;
    has count => (is => 'rw', isa => PositiveInt);

    ...
    #this will fail
    $object->count(-33);

=head1 DESCRIPTION

A set of commonly-used numeric type constraints that do not ship with Moose by
default.

=over

=item * PositiveNum

=item * PositiveInt

=item * NegativeNum

=item * Int

=item * SingleDigit

=back

=head1 SEE ALSO

=over

=item * L<MooseX::Types::Common::String>

=back

=head1 AUTHORS

Please see:: L<MooseX::Types::Common>

=cut
