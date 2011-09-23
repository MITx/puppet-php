
class php {
  include php::install
}

class php::install {

  $pkg = $operatingsystem ? {
    centos => "php",
    debian => "libapache2-mod-php5",
    ubuntu => "libapache2-mod-php5",
  }

  package { $pkg :
    ensure => installed,
  }

}


class php::apache {
  include php::apache::package
}

class php::apache::package {

  $pkg = $operatingsystem ? {
    debian => "libapache2-mod-php5",
  }

  package { $pkg :
    ensure => installed,
  }
}


class php::cli {
  include php::cli::package
}

class php::cli::package {

  $pkg = $operatingsystem ? {
    debian => "php5-cli",
  }

  package { $pkg :
    ensure => installed,
  }
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
