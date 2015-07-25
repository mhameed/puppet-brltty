# == Class brltty::config
#
# This class is called from brltty for service config.
#
class brltty::config {
  $config_file = '/etc/brltty.conf'

  concat { $config_file:
    owner => 'root',
    group => 'root',
    mode  => '0644'
#    notify => Service[$::brltty::service_name]
  }

  concat::fragment{ 'settings':
    target  => $config_file,
    content => "text-table ${::brltty::text_table}\n",
    order   => '01'
  }

}
