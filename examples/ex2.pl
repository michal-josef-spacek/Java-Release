#!/usr/bin/env perl

use strict;
use warnings;

use Data::Printer;
use Java::Release::Obj;

my $obj = Java::Release::Obj->new(
        arch => 'i386',
        os => 'linux',
        release => 1,
);

p $obj;

# Output like:
# TODO