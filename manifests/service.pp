# == Class brltty::service
#
# This class is meant to be called from brltty.
# It ensure the service is running.
#
class brltty::service {

  service { $::brltty::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
