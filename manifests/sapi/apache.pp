
class php::sapi::apache (
  $packages = $php::params::sapi_apache_packages
) inherits php::params {

  package { $packages :
    ensure => installed,
  }

}
