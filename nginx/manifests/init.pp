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

class nginx::logging {
  nginx::config::log_format { 'main':
    ensure => present,
    format => '$remote_addr - $remote_user [$time_local] "$request" $status $body_bytes_sent "$http_referer" "$http_user_agent" "$http_x_forwarded_for" $request_time',
  }
  nginx::config::location { '/':
    ensure => present,
    log_format => 'main',
    access_log => '/var/log/nginx/access.log',
  }
}

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
