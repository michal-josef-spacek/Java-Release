use strict;
use warnings;

use Java::Release::Obj;
use Test::More 'tests' => 6;
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
	update => 30,
);
$ret = $obj->version;
is($ret, '1.0.30', 'Get version (release and update).');

# Test.
$obj = Java::Release::Obj->new(
	arch => 'i386',
	interim => 2,
	os => 'linux',
	release => 1,
	update => 30,
);
$ret = $obj->version;
is($ret, '1.2.30', 'Get version (release, interim and update).');

# Test.
$obj = Java::Release::Obj->new(
	arch => 'i386',
	os => 'linux',
	release => 1,
	update => 234,
);
$ret = $obj->version('old');
is($ret, '1u234', 'Get version (release and update, old format).');

# Test.
$obj = Java::Release::Obj->new(
	arch => 'i386',
	os => 'linux',
	release => 1,
	update => 234,
);
$ret = $obj->version('new');
is($ret, '1.0.234', 'Get version (release and update, new format).');
