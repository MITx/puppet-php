#
# =Class: php::sapi::fpm
#
# Install and (don't bother trying to) configure the PHP FPM daemon.
#
class php::sapi::fpm {

	include php::sapi::fpm::install
	include php::sapi::fpm::configure
	include php::sapi::fpm::service

}

class php::sapi::fpm::install (
	$packages = $php::params::sapi_fpm_packages
) inherits php::params {

	package { $packages :
		ensure => installed,
	}

	file { "/var/log/php5-fpm" :
		ensure => 'directory',
		owner => root,
		group => root,
		mode => 0750,
	}

}

class php::sapi::fpm::configure (
	$php_ini = $php::params::sapi_fpm_config,
	$php_ini_d = $php::params::sapi_fpm_config_d,
	$php_fpm = $php::params::sapi_fpm_config_service,
	$php_pools = $php::params::sapi_fpm_pools
) inherits php::params {

	file { $php_fpm :
		ensure => present,
	}

	file { $php_ini :
		ensure => present,
	}

	file { $php_ini_d :
		ensure => present,
		recurse => true,
	}

	file { $php_pools :
		ensure => directory,
		recurse => true,
	}


	Class['php::sapi::fpm::install'] -> Class['php::sapi::fpm::configure']
	Class['php::sapi::fpm::configure'] ~> Class['php::sapi::fpm::service']

}

class php::sapi::fpm::service (
	$php_fpm_service = $php::params::sapi_fpm_service
) inherits php::params {

	service { $php_fpm_service :
		enable => true,
		ensure => running,
		hasrestart => true,
	}

}
