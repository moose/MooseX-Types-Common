package MooseX::Types::Common::Numeric;
# ABSTRACT: Commonly used numeric types

our $VERSION = '0.001016';

use strict;
use warnings;

use MooseX::Types -declare => [
  qw(PositiveNum PositiveOrZeroNum
     PositiveInt PositiveOrZeroInt
     NegativeNum NegativeOrZeroNum
     NegativeInt NegativeOrZeroInt
     SingleDigit)
];

use Moose ();
use MooseX::Types::Moose qw/Num Int/;
use if MooseX::Types->VERSION >= 0.42, 'namespace::autoclean';

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

subtype PositiveOrZeroNum,
  as Num,
  where { $_ >= 0 },
  message { "Must be a number greater than or equal to zero" },
    ( $Moose::VERSION >= 2.0200
        ? inline_as {
            $_[0]->parent()->_inline_check( $_[1] ) . ' && '
                . qq{ ($_[1] >= 0) };
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

subtype PositiveOrZeroInt,
  as Int,
  where { $_ >= 0 },
  message { "Must be an integer greater than or equal to zero" },
    ( $Moose::VERSION >= 2.0200
        ? inline_as {
            $_[0]->parent()->_inline_check( $_[1] ) . ' && '
                . qq{ ($_[1] >= 0) };
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

subtype NegativeOrZeroNum,
  as Num,
  where { $_ <= 0 },
  message { "Must be a number less than or equal to zero" },
    ( $Moose::VERSION >= 2.0200
        ? inline_as {
            $_[0]->parent()->_inline_check( $_[1] ) . ' && '
                . qq{ ($_[1] <= 0) };
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

subtype NegativeOrZeroInt,
  as Int,
  where { $_ <= 0 },
  message { "Must be an integer less than or equal to zero" },
    ( $Moose::VERSION >= 2.0200
        ? inline_as {
            $_[0]->parent()->_inline_check( $_[1] ) . ' && '
                . qq{ ($_[1] <= 0) };
        }
        : ()
    );

subtype SingleDigit,
  as Int,
  where { $_ >= -9 and $_ <= 9 },
  message { "Must be a single digit" },
    ( $Moose::VERSION >= 2.0200
        ? inline_as {
            $_[0]->parent()->_inline_check( $_[1] ) . ' && '
                . qq{ ($_[1] >= -9 and $_[1] <= 9) };
        }
        : ()
    );

1;

__END__

=pod

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

=item * C<PositiveNum>

=item * C<PositiveOrZeroNum>

=item * C<PositiveInt>

=item * C<PositiveOrZeroInt>

=item * C<NegativeNum>

=item * C<NegativeOrZeroNum>

=item * C<NegativeInt>

=item * C<NegativeOrZeroInt>

=item * C<SingleDigit>

=back

=head1 SEE ALSO

=over

=item * L<MooseX::Types::Common::String>

=back

=cut
