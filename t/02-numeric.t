#! /usr/bin/perl -w

use strict;
use warnings;
use Test::More tests => 34;
use Test::Fatal;

{
  package FooTest;
  use Moose;
  use MooseX::Types::Common::Numeric (
    qw(PositiveNum PositiveOrZeroNum
       PositiveInt PositiveOrZeroInt
       NegativeNum NegativeOrZeroNum
       NegativeInt NegativeOrZeroInt
       SingleDigit)
  );

  has digit => ( is => 'rw', isa => SingleDigit);
  has posnum => ( is => 'rw', isa => PositiveNum);
  has posint => ( is => 'rw', isa => PositiveInt);
  has negnum => ( is => 'rw', isa => NegativeNum);
  has negint => ( is => 'rw', isa => NegativeInt);
  has posorzeronum => ( is => 'rw', isa => PositiveOrZeroNum);
  has posorzeroint => ( is => 'rw', isa => PositiveOrZeroInt);
  has negorzeronum => ( is => 'rw', isa => NegativeOrZeroNum);
  has negorzeroint => ( is => 'rw', isa => NegativeOrZeroInt);
}

my $ins = FooTest->new;

isnt(exception { $ins->digit(100); }, undef, 'SingleDigit');
is(exception { $ins->digit(1); }, undef, 'SingleDigit 2');

isnt(exception { $ins->posint(-100); }, undef, 'PositiveInt (-100)');
isnt(exception { $ins->posint(0); }, undef, 'PositiveInt (0)');
isnt(exception { $ins->posint(100.885); }, undef, 'PositiveInt (100.885)');
is(exception { $ins->posint(100); }, undef, 'PositiveInt (100)');
isnt(exception { $ins->posnum(0); }, undef, 'PositiveNum (0)');
is(exception { $ins->posnum(100.885); }, undef, 'PositiveNum (100.885)');
isnt(exception { $ins->posnum(-100.885); }, undef, 'PositiveNum (-100.885)');
is(exception { $ins->posnum(0.0000000001); }, undef, 'PositiveNum (0.0000000001)');

isnt(exception { $ins->posorzeroint(-100); }, undef, 'PositiveOrZeroInt (-100)');
is(exception { $ins->posorzeroint(0); }, undef, 'PositiveOrZeroInt (0)');
isnt(exception { $ins->posorzeroint(100.885); }, undef, 'PositiveOrZeroInt (100.885)');
is(exception { $ins->posorzeroint(100); }, undef, 'PositiveOrZeroInt (100)');
is(exception { $ins->posorzeronum(0); }, undef, 'PositiveOrZeroNum (0)');
is(exception { $ins->posorzeronum(100.885); }, undef, 'PositiveOrZeroNum (100.885)');
isnt(exception { $ins->posorzeronum(-100.885); }, undef, 'PositiveOrZeroNum (-100.885)');
is(exception { $ins->posorzeronum(0.0000000001); }, undef, 'PositiveOrZeroNum (0.0000000001)');

isnt(exception { $ins->negint(100); }, undef, 'NegativeInt (100)');
isnt(exception { $ins->negint(-100.885); }, undef, 'NegativeInt (-100.885)');
is(exception { $ins->negint(-100); }, undef, 'NegativeInt (-100)');
isnt(exception { $ins->negint(0); }, undef, 'NegativeInt (0)');
is(exception { $ins->negnum(-100.885); }, undef, 'NegativeNum (-100.885)');
isnt(exception { $ins->negnum(100.885); }, undef, 'NegativeNum (100.885)');
isnt(exception { $ins->negnum(0); }, undef, 'NegativeNum (0)');
is(exception { $ins->negnum(-0.0000000001); }, undef, 'NegativeNum (-0.0000000001)');

isnt(exception { $ins->negorzeroint(100); }, undef, 'NegativeOrZeroInt (100)');
isnt(exception { $ins->negorzeroint(-100.885); }, undef, 'NegativeOrZeroInt (-100.885)');
is(exception { $ins->negorzeroint(-100); }, undef, 'NegativeOrZeroInt (-100)');
is(exception { $ins->negorzeroint(0); }, undef, 'NegativeOrZeroInt (0)');
is(exception { $ins->negorzeronum(-100.885); }, undef, 'NegativeOrZeroNum (-100.885)');
isnt(exception { $ins->negorzeronum(100.885); }, undef, 'NegativeOrZeroNum (100.885)');
is(exception { $ins->negorzeronum(0); }, undef, 'NegativeOrZeroNum (0)');
is(exception { $ins->negorzeronum(-0.0000000001); }, undef, 'NegativeOrZeroNum (-0.0000000001)');
