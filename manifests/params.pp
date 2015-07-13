# == Class brltty::params
#
# This class is meant to be called from brltty.
# It sets variables according to platform.
#
class brltty::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'brltty'
      $service_name = 'brltty'
    }
    'RedHat', 'Amazon': {
      $package_name = 'brltty'
      $service_name = 'brltty'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
