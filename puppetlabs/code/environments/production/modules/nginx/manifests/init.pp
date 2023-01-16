class nginx {
  package { 'nginx':
    ensure => installed,
  }

  file { '/etc/nginx/nginx.conf':
    ensure  => file,
    source  => 'puppet:///modules/nginx/nginx.conf',
    require => Package['nginx'],
  }

  service { 'nginx':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    subscribe  => File['/etc/nginx/nginx.conf'],
  }
}
