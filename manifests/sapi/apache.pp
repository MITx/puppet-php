#
# Class:
#     php::sapi::apache
#
# Description:
#     Install and (fail to) configure the Apache PHP module.
#
class php::sapi::apache {

	notify { "Installing php for apache" : }

	include php::sapi::apache::install
	include php::sapi::apache::configure


}


class php::sapi::apache::install (
	$packages = $php::params::sapi_apache_packages
) inherits php::params {

	package { $packages :
		ensure => installed,
	}

}

class php::sapi::apache::configure (
	$php_ini = $php::params::sapi_apache_config,
	$php_ini_d = $php::params::sapi_apache_config_d
) inherits php::params {


	file { $php_ini :
		ensure => present,
	}

	file { $php_ini_d :
		ensure => present,
		recurse => true,
	}

	Class['php::sapi::apache::install'] -> Class['php::sapi::apache::configure']
	Class['php::sapi::apache::configure'] ~> Class['apache::service']
}

