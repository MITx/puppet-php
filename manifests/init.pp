
class php {

}

class php::mysql {
  include php::mysql::package
}

class php::mysql::package {

  include php::package

  $pkg = $operatingsystem ? {
    centos => "php-mysql",
    debian => "php5-mysql",
    ubuntu => "php5-mysql",
  }

  package { $pkg :
    ensure => installed,
    require => Class["php::package"],
  }

}


class php::gd {
  include php::gd::package
}

class php::gd::package {

  include php::package

  $pkg = $operatingsystem ? {
    debian => "php5-gd",
  }

  package { $pkg :
    ensure  => installed,
    require => Class["php::package"],
  }

}


class php::apc {
  include php::apc::package
}

class php::apc::package {

  include php::package

  $pkg = $operatingsystem ? {
    debian => "php-apc"
  }
  
  package { $pkg :
    ensure  => installed,
    require => Class["php::package"],
  }

}

class php::curl {
  include php::curl::package
}

class php::curl::package {

  $pkg = $operatingsystem ? {
    debian => "php5-curl"
  }

  package { $pkg :
    ensure  => installed,
    require => Class["php::package"],
  }

}
