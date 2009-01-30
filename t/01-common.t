#! /usr/bin/perl -w

use strict;
use warnings;
use Test::More tests => 26;
use Test::Exception;

{
  package FooTest;
  use Moose;
  use MooseX::Types::Common (
    qw(SimpleStr NonEmptySimpleStr Password StrongPassword NonEmptyStr),
    qw(PositiveNum PositiveInt NegativeInt NegativeNum SingleDigit)
  );

  has simplestr => ( is => 'rw', isa => SimpleStr);
  has nestr => ( is => 'rw', isa => NonEmptyStr);
  has nesimplestr => ( is => 'rw', isa => NonEmptySimpleStr);
  has password => ( is => 'rw', isa => Password);
  has strongpassword => ( is => 'rw', isa => StrongPassword);

  has digit => ( is => 'rw', isa => SingleDigit);
  has posnum => ( is => 'rw', isa => PositiveNum);
  has posint => ( is => 'rw', isa => PositiveInt);
  has negnum => ( is => 'rw', isa => NegativeNum);
  has negint => ( is => 'rw', isa => NegativeInt);
}

my $ins = FooTest->new;

lives_ok { $ins->simplestr('') } 'SimpleStr';
lives_ok { $ins->simplestr('good string') } 'SimpleStr 2';
dies_ok { $ins->simplestr("bad\nstring") } 'SimpleStr 3';
dies_ok { $ins->simplestr(join('', ("long string" x 25))) } 'SimpleStr 4';

dies_ok { $ins->nestr('') } 'NonEmptyStr';
lives_ok { $ins->nestr('good string') } 'NonEmptyStr 2';
lives_ok { $ins->nestr("bad\nstring") } 'NonEmptyStr 3';
lives_ok { $ins->nestr(join('', ("long string" x 25))) } 'NonEmptyStr 4';

lives_ok { $ins->nesimplestr('good str') } 'NonEmptySimplrStr ';
dies_ok { $ins->nesimplestr('') } 'NonEmptyStr 2';

dies_ok { $ins->password('no') } 'Password';
lives_ok { $ins->password('okay') } 'Password 2';

dies_ok { $ins->strongpassword('notokay') } 'StrongPassword';
lives_ok { $ins->strongpassword('83773r_ch01c3') } 'StrongPassword 2';

dies_ok { $ins->digit(100); } 'SingleDigit';
lives_ok { $ins->digit(1); } 'SingleDigit 2';

dies_ok { $ins->posint(-100); } 'PositiveInt';
dies_ok { $ins->posint(100.885); } 'PositiveInt 2';
lives_ok { $ins->posint(100); } 'PositiveInt 3';
lives_ok { $ins->posnum(100.885); } 'PositiveNum';
dies_ok { $ins->posnum(-100.885); } 'PositiveNum 2';

dies_ok { $ins->negint(100); } 'NegativeInt';
dies_ok { $ins->negint(-100.885); } 'NegativeInt 2';
lives_ok { $ins->negint(-100); } 'NegativeInt 3';
lives_ok { $ins->negnum(-100.885); } 'NegativeNum';
dies_ok { $ins->negnum(100.885); } 'NegativeNum 2';
