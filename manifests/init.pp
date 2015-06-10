# Install Iperf
class iperf (
  $firewall = false,
  $restart = false,
  $version = ['3'],
  $motd = false,
) {

  if member($version, '2') {
    # Install iperf2
    if $motd {
      motd::register{'Iperf 2 server': }
    }

    # Install package
    package { 'iperf':
      ensure => installed,
    }

    # Install init script
    file { '/etc/init.d/iperf2':
      source => 'puppet:///modules/iperf/iperf2',
      mode   => '0755',
      owner  => 'root',
      group  => 'root',
      notify => Service['iperf2'],
    }

    # Start the service
    service { 'iperf2':
      ensure     => 'running',
      enable     => true,
      hasrestart => true,
      require    => [
        Package['iperf'],
        File['/etc/init.d/iperf2'],
      ],
    }

    # Add firewall rule
    if ($firewall) {
      firewall { '100-iperf2':
        proto  => 'tcp',
        dport  => '5001',
        action => 'accept',
      }
    }

    # Kick iperfd regularly
    if ($restart) {
      cron { 'iperfd':
        command => '',
      }
    }
  }

  if member($version, '3') {
    # Install iperf3
    if $motd {
      motd::register{'Iperf 3 server': }
    }

    # Install package
    package { 'iperf3':
      ensure => installed,
    }

    # Install init script
    file { '/etc/init.d/iperf3':
      source => 'puppet:///modules/iperf/iperf3',
      mode   => '0755',
      owner  => 'root',
      group  => 'root',
      notify => Service['iperf3'],
    }

    # Start the service
    service { 'iperf3':
      ensure     => 'running',
      enable     => true,
      hasrestart => true,
      require    => [
        Package['iperf3'],
        File['/etc/init.d/iperf3'],
      ],
    }

    # Add firewall rule
    if ($firewall) {
      firewall { '100-iperf3':
        proto  => 'tcp',
        dport  => '5201',
        action => 'accept',
      }
    }
  }
}
