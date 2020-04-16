use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Java::Release::Obj;
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Test.
my $obj = Java::Release::Obj->new(
	arch => 'i386',
	os => 'linux',
	release => 1,
);
my $ret = $obj->version_type;
is($ret, 'new', 'Get type of version (default value).');

# Test.
$obj = Java::Release::Obj->new(
	arch => 'i386',
	os => 'linux',
	release => 1,
	version_type => 'old',
);
$ret = $obj->version_type;
is($ret, 'old', 'Get type of version (old value).');

# Test.
eval {
	Java::Release::Obj->new(
		arch => 'i386',
		os => 'linux',
		release => 1,
		version_type => 'bad',
	);
};
is($EVAL_ERROR, "Bad version type. Possible values are 'new' or 'old'.\n",
	"Bad versio type.");
clean();
