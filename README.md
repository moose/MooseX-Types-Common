# NAME

MooseX::Types::Common - A library of commonly used type constraints

# VERSION

version 0.001009

# SYNOPSIS

    use MooseX::Types::Common::String qw/SimpleStr/;
    has short_str => (is => 'rw', isa => SimpleStr);

    ...
    #this will fail
    $object->short_str("string\nwith\nbreaks");



    use MooseX::Types::Common::Numeric qw/PositiveInt/;
    has count => (is => 'rw', isa => PositiveInt);

    ...
    #this will fail
    $object->count(-33);

# DESCRIPTION

A set of commonly-used type constraints that do not ship with Moose by default.

# SEE ALSO

- [MooseX::Types::Common::String](http://search.cpan.org/perldoc?MooseX::Types::Common::String)
- [MooseX::Types::Common::Numeric](http://search.cpan.org/perldoc?MooseX::Types::Common::Numeric)
- [MooseX::Types](http://search.cpan.org/perldoc?MooseX::Types)
- [Moose::Util::TypeConstraints](http://search.cpan.org/perldoc?Moose::Util::TypeConstraints)

# ORIGIN

This distribution was extracted from the [Reaction](http://search.cpan.org/perldoc?Reaction) code base by Guillermo
Roditi (groditi).

# AUTHORS

- Matt S Trout - mst (at) shadowcatsystems.co.uk ([http://www.shadowcatsystems.co.uk/](http://www.shadowcatsystems.co.uk/))
- K. James Cheetham <jamie@shadowcatsystems.co.uk>
- Guillermo Roditi <groditi@gmail.com>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Matt S Trout - mst (at) shadowcatsystems.co.uk ([http://www.shadowcatsystems.co.uk/](http://www.shadowcatsystems.co.uk/)).

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

# CONTRIBUTORS

- Dave Rolsky <autarch@urth.org>
- Justin Hunter <justin.d.hunter@gmail.com>
- Karen Etheridge <ether@cpan.org>
- Toby Inkster <tobyink@cpan.org>
- Tomas Doran <bobtfish@bobtfish.net>
