# == Class brltty::config
#
# This class is called from brltty for service config.
#
class brltty::config {
  $config_file = '/etc/brltty.conf'

  file { $config_file:
    owner => 'root',
    group => 'root',
    mode  => '0644',
    notify => Service[$::brltty::service_name],
    content => "text-table ${::brltty::text_table}\n",
  }

}
