use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Java::Release qw(parse_java_jdk_release);
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Test.
my $ret_hr = parse_java_jdk_release('jdk-7u15-linux-i586.tar.gz');
is_deeply(
	$ret_hr,
	{
		'j2se_release' => 7,
		'j2se_update' => 15,
		'j2se_arch' => 'i586',
		'j2se_version' => '7u15',
		'j2se_version_name' => '7 Update 15',
	},
	'Detect JDK 7u15.',
);

# Test.
$ret_hr = parse_java_jdk_release('jdk-7-linux-i586.tar.gz');
is_deeply(
	$ret_hr,
	{
		'j2se_release' => 7,
		'j2se_update' => undef,
		'j2se_arch' => 'i586',
		'j2se_version' => '7',
		'j2se_version_name' => '7 GA',
	},
	'Detect JDK 7.',
);

# Test.
eval {
	parse_java_jdk_release('foo-bar');
};
is($EVAL_ERROR, "Unsupported release.\n", 'Cannot parse release name.');
clean();
