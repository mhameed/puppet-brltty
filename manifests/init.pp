# Class: brltty
# ===========================
#
# Full description of class brltty here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class brltty (
  $package_name = $::brltty::params::package_name,
  $service_name = $::brltty::params::service_name,
  $text_table = $::brltty::params::text_table,
) inherits ::brltty::params {

  # validate parameters here
  validate_string($text_table)

  class { '::brltty::install': } ->
  class { '::brltty::config': } ~>
  class { '::brltty::service': } ->
  Class['::brltty']
}
