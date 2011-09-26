#
# Define: php::extension
#
# This defined resource type installs a php extension.
#
define php::extension (
	$ensure = 'disabled'
) {

	$package = $name ? {
		"apc" => "php-${name}",
		default => "php5-${name}",
	}

	package { $package :
		ensure => installed,
	}
}

