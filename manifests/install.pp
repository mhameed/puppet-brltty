# == Class brltty::install
#
# This class is called from brltty for install.
#
class brltty::install {

  package { $::brltty::package_name:
    ensure => present,
  }
}
