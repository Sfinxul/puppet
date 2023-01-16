class nginx::proxy_health_check {
  nginx::config::location { '/health':
    ensure => present,
    proxy_pass => 'http://localhost:8080/health',
    proxy_http_version => 1.1,
    proxy_set_header => [
      'Connection "upgrade"',
      'Host $host',
      'X-Real-IP $remote_addr',
      'X-Forwarded-For $proxy_add_x_forwarded_for',
    ],
    proxy_read_timeout => 90,
    proxy_next_upstream => 'error timeout',
  }
}
