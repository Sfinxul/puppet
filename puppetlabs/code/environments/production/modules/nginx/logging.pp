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
