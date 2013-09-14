use strict;
use warnings FATAL => 'all';

use Test::More;
use if $ENV{AUTHOR_TESTING}, 'Test::Warnings';

use MooseX::Types::Common::String qw(
    LowerCaseSimpleStr
    UpperCaseSimpleStr
    LowerCaseStr
    UpperCaseStr
    NumericCode
);

is(to_UpperCaseSimpleStr('foo'), 'FOO', 'uppercase str' );
is(to_LowerCaseSimpleStr('BAR'), 'bar', 'lowercase str' );

is(to_UpperCaseStr('foo'), 'FOO', 'uppercase str' );
is(to_LowerCaseStr('BAR'), 'bar', 'lowercase str' );

is(to_NumericCode('4111-1111-1111-1111'), '4111111111111111', 'numeric code' );

done_testing;
