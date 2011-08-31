#! /usr/bin/perl -w

use strict;
use warnings;
use Test::More tests => 18;
use Test::Exception;

{
  package FooTest;
  use Moose;
  use MooseX::Types::Common::Numeric (
    qw(PositiveNum PositiveInt NegativeInt NegativeNum SingleDigit)
  );

  has digit => ( is => 'rw', isa => SingleDigit);
  has posnum => ( is => 'rw', isa => PositiveNum);
  has posint => ( is => 'rw', isa => PositiveInt);
  has negnum => ( is => 'rw', isa => NegativeNum);
  has negint => ( is => 'rw', isa => NegativeInt);
}

my $ins = FooTest->new;

dies_ok { $ins->digit(100); } 'SingleDigit';
lives_ok { $ins->digit(1); } 'SingleDigit 2';

dies_ok { $ins->posint(-100); } 'PositiveInt (-100)';
dies_ok { $ins->posint(0); } 'PositiveInt (0)';
dies_ok { $ins->posint(100.885); } 'PositiveInt (100.885)';
lives_ok { $ins->posint(100); } 'PositiveInt (100)';
dies_ok { $ins->posnum(0); } 'PositiveNum (0)';
lives_ok { $ins->posnum(100.885); } 'PositiveNum (100.885)';
dies_ok { $ins->posnum(-100.885); } 'PositiveNum (-100.885)';
lives_ok { $ins->posnum(0.0000000001); } 'PositiveNum (0.0000000001)';

dies_ok { $ins->negint(100); } 'NegativeInt (100)';
dies_ok { $ins->negint(-100.885); } 'NegativeInt (-100.885)';
lives_ok { $ins->negint(-100); } 'NegativeInt (-100)';
dies_ok { $ins->negint(0); } 'NegativeInt (0)';
lives_ok { $ins->negnum(-100.885); } 'NegativeNum (-100.885)';
dies_ok { $ins->negnum(100.885); } 'NegativeNum (100.885)';
dies_ok { $ins->negnum(0); } 'NegativeNum (0)';
lives_ok { $ins->negnum(-0.0000000001); } 'NegativeNum (-0.0000000001)';
