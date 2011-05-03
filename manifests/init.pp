
class php5 {
  include php5::package
}

class php5::package {

  $pkg = $operatingsystem ? {
    centos => "php",
    debian => "libapache2-mod-php5",
    ubuntu => "libapache2-mod-php5",
  }

  package { $pkg :
    ensure => installed,
  }

}


class php5::apache {
  include php5::apache::package
}

class php5::apache::package {

  $pkg = $operatingsystem ? {
    debian => "libapache2-mod-php5",
  }

  package { $pkg :
    ensure => installed,
  }
}


class php5::cli {
  include php5::cli::package
}

class php5::cli::package {

  $pkg = $operatingsystem ? {
    debian => "php5-cli",
  }

  package { $pkg :
    ensure => installed,
  }
}


class php5::mysql {
  include php5::mysql::package
}

class php5::mysql::package {

  include php5::package

  $pkg = $operatingsystem ? {
    centos => "php-mysql",
    debian => "php5-mysql",
    ubuntu => "php5-mysql",
  }

  package { $pkg :
    ensure => installed,
    require => Class["php5::package"],
  }

}


class php5::gd {
  include php5::gd::package
}

class php5::gd::package {

  include php5::package

  $pkg = $operatingsystem ? {
    debian => "php5-gd",
  }

  package { $pkg :
    ensure  => installed,
    require => Class["php5::package"],
  }

}


class php5::apc {
  include php5::apc::package
}

class php5::apc::package {

  include php5::package

  $pkg = $operatingsystem ? {
    debian => "php-apc"
  }
  
  package { $pkg :
    ensure  => installed,
    require => Class["php5::package"],
  }

}


class php5::curl {
  include php5::curl::package
}

class php5::curl::package {

  $pkg = $operatingsystem ? {
    debian => "php5-curl"
  }

  package { $pkg :
    ensure  => installed,
    require => Class["php::package"],
  }

}
