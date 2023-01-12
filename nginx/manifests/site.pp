node 'your_host' {
  include nginx
  include nginx::redirects
  include nginx::logging
  include nginx::proxy_health_check
}
