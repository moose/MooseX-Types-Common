#! /usr/bin/perl -w

use strict;
use warnings;
use Test::More tests => 22;
use Test::Fatal;

{
  package FooTest;
  use Moose;
  use MooseX::Types::Common::String (
    qw(SimpleStr
       NonEmptySimpleStr
       LowerCaseSimpleStr
       UpperCaseSimpleStr
       Password
       StrongPassword
       NonEmptyStr
       LowerCaseStr
       UpperCaseStr),
  );

  has simplestr => ( is => 'rw', isa => SimpleStr );
  has nestr => ( is => 'rw', isa => NonEmptyStr );
  has nesimplestr => ( is => 'rw', isa => NonEmptySimpleStr );
  has lcsimplestr => ( is => 'rw', isa => LowerCaseSimpleStr );
  has ucsimplestr => ( is => 'rw', isa => UpperCaseSimpleStr );
  has password => ( is => 'rw', isa => Password );
  has strongpassword => ( is => 'rw', isa => StrongPassword );
  has lowercasestr => ( is => 'rw', isa => LowerCaseStr );
  has uppercasestr => ( is => 'rw', isa => UpperCaseStr );
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

isnt(exception { $ins->lcsimplestr('NOTOK') }, undef, 'LowerCaseSimpleStr');
is(exception { $ins->lcsimplestr('ok') }, undef, 'LowerCaseSimpleStr 2');

isnt(exception { $ins->ucsimplestr('notok') }, undef, 'UpperCaseSimpleStr');
is(exception { $ins->ucsimplestr('OK') }, undef, 'UpperCaseSimpleStr 2');

isnt(exception { $ins->lowercasestr('NOTOK') }, undef, 'LowerCaseStr');
is(exception { $ins->lowercasestr('ok') }, undef, 'LowerCaseStr 2');

isnt(exception { $ins->uppercasestr('notok') }, undef, 'UpperCaseStr');
is(exception { $ins->uppercasestr('OK') }, undef, 'UpperCaseStr 2');
