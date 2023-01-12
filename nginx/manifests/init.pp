class nginx::proxy {
  # Redirect requests for https://domain.com to 10.10.10.10
  nginx::resource::location { 'domain.com':
    ensure      => present,
    location    => '/',
    proxy_pass  => 'http://10.10.10.10',
    proxy_redirect => 'off',
  }

  # Redirect requests for https://domain.com/resource2 to 20.20.20.20
  nginx::resource::location { 'domain.com/resource2':
    ensure      => present,
    location    => '/resource2',
    proxy_pass  => 'http://20.20.20.20',
    proxy_redirect => 'off',
  }
  
  # Log HTTP requests going from the internal network to the Internet
  nginx::resource::location { 'log_http_requests':
    ensure      => present,
    location    => '/',
    proxy_log_path  => '/var/log/nginx/http_requests.log',
    proxy_log_format => '$remote_addr $protocol $time_local',
  }
  
  # Implement a proxy health check
  nginx::resource::location { 'proxy_health_check':
    ensure      => present,
    location    => '/health',
    proxy_pass => 'http://10.10.10.10',
    proxy_http_version => '1.1',
    proxy_interval => '10s',
    proxy_timeout => '10s',
    proxy_connect_timeout => '10s',
    proxy_next_upstream => 'error timeout invalid_header http_500 http_502 http_503 http_504',
  }
}
