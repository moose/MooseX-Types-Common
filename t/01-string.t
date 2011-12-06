#! /usr/bin/perl -w

use strict;
use warnings;
use Test::More tests => 14;
use Test::Fatal;

{
  package FooTest;
  use Moose;
  use MooseX::Types::Common::String (
    qw(SimpleStr NonEmptySimpleStr Password StrongPassword NonEmptyStr),
  );

  has simplestr => ( is => 'rw', isa => SimpleStr);
  has nestr => ( is => 'rw', isa => NonEmptyStr);
  has nesimplestr => ( is => 'rw', isa => NonEmptySimpleStr);
  has password => ( is => 'rw', isa => Password);
  has strongpassword => ( is => 'rw', isa => StrongPassword);
}

my $ins = FooTest->new;

is(exception { $ins->simplestr('') }, undef, 'SimpleStr');
is(exception { $ins->simplestr('good string') }, undef, 'SimpleStr 2');
isnt(exception { $ins->simplestr("bad\nstring") }, 'SimpleStr 3');
isnt(exception { $ins->simplestr(join('', ("long string" x 25))) }, undef, 'SimpleStr 4');

isnt(exception { $ins->nestr('') }, undef, 'NonEmptyStr');
is(exception { $ins->nestr('good string') }, undef, 'NonEmptyStr 2');
is(exception { $ins->nestr("bad\nstring") }, undef, 'NonEmptyStr 3');
is(exception { $ins->nestr(join('', ("long string" x 25))) }, undef, 'NonEmptyStr 4');

is(exception { $ins->nesimplestr('good str') }, undef, 'NonEmptySimplrStr');
isnt(exception { $ins->nesimplestr('') }, undef, 'NonEmptyStr 2');

isnt(exception { $ins->password('no') }, undef, 'Password');
is(exception { $ins->password('okay') }, undef, 'Password 2');

isnt(exception { $ins->strongpassword('notokay') }, undef, 'StrongPassword');
is(exception { $ins->strongpassword('83773r_ch01c3') }, undef, 'StrongPassword 2');
