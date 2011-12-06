#! /usr/bin/perl -w

use strict;
use warnings;
use Test::More tests => 4;

{
  package FooTest;
  use Moose;
  use MooseX::Types::Common::String ( qw( LowerCaseSimpleStr UpperCaseSimpleStr LowerCaseStr UpperCaseStr) );

  has uppercasesimplestr => ( is => 'rw', isa => UpperCaseSimpleStr, coerce => 1 );
  has lowercasesimplestr => ( is => 'rw', isa => LowerCaseSimpleStr, coerce => 1 );
  has uppercasestr => ( is => 'rw', isa => UpperCaseStr, coerce => 1 );
  has lowercasestr => ( is => 'rw', isa => LowerCaseStr, coerce => 1 );
}

my $ins = FooTest->new({
  uppercasesimplestr => 'foo',
  lowercasesimplestr => 'BAR',
  uppercasestr => 'foo',
  lowercasestr => 'BAR',
});

is( $ins->uppercasesimplestr, 'FOO', 'uppercase str' );
is( $ins->lowercasesimplestr, 'bar', 'lowercase str' );

is( $ins->uppercasestr, 'FOO', 'uppercase str' );
is( $ins->lowercasestr, 'bar', 'lowercase str' );
