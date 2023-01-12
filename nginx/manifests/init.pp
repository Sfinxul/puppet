nginx::resource::location { 'domain.com':
  location => '/',
  proxy_pass => 'http://10.10.10.10',
  proxy_redirect => 'off',
}

nginx::resource::location { 'resource2':
  location => '/resource2',
  proxy_pass => 'http://20.20.20.20',
  proxy_redirect => 'off',
}

nginx::resource::location { 'forward_proxy':
  location => '/',
  proxy_pass => 'http://$remote_addr',
  proxy_redirect => 'off',
  access_log => '/var/log/nginx/forward_proxy.log combined',
}

nginx::resource::location { 'health_check':
  location => '/health',
  proxy_pass => 'http://10.10.10.10',
  proxy_redirect => 'off',
  health_check => 'http://10.10.10.10/health 200',
}
