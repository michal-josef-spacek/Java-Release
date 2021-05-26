use strict;
use warnings;

use Java::Release::Obj;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Test.
my $obj = Java::Release::Obj->new(
	arch => 'i386',
	os => 'linux',
	release => 1,
);
my $ret = $obj->version;
is($ret, 1, 'Get version (only release).');

# Test.
$obj = Java::Release::Obj->new(
	arch => 'i386',
	os => 'linux',
	release => 1,
	update => 234,
	version_type => 'old',
);
$ret = $obj->version;
is($ret, '1u234', 'Get version (release and update, old format).');