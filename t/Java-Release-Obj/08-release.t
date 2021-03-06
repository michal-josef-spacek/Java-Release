use strict;
use warnings;

use Java::Release::Obj;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
my $obj = Java::Release::Obj->new(
	arch => 'i386',
	os => 'linux',
	release => 1,
);
my $ret = $obj->release;
is($ret, 1, 'Get release version number.');
