use strict;
use warnings;

use Test::More;
use Test::CleanNamespaces;

use Test::Needs { 'MooseX::Types' => '0.42' };
all_namespaces_clean();

done_testing;
