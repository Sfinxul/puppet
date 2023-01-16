class nginx::redirects {
  nginx::resource::vhost { 'domain.com':
    ensure => present,
    proxy_pass => '10.10.10.10',
    proxy_redirect => [
      'https://domain.com https://10.10.10.10',
      'https://domain.com/resource2 https://20.20.20.20',
    ],
  }
}
