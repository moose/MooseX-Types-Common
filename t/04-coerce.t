#! /usr/bin/perl -w

use strict;
use warnings;
use Test::More tests => 2;

{
  package FooTest;
  use Moose;
  use MooseX::Types::Common::String (qw(
    LowerCaseStr
    UpperCaseStr
  ),);

  has uppercasestr => ( is => 'rw', isa => UpperCaseStr, coerce => 1 );
  has lowercasestr => ( is => 'rw', isa => LowerCaseStr, coerce => 1 );
}

my $ins = FooTest->new({
  uppercasestr => 'foo',
  lowercasestr => 'BAR',
});

is( $ins->uppercasestr, 'FOO', 'uppercase str' );
is( $ins->lowercasestr, 'bar', 'lowercase str' );
