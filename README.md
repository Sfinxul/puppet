# Puppet nginx module
This is a repo for puppet modules and tests

This nginx Puppet module creates three classes: nginx::redirects, nginx::logging, and nginx::proxy_health_check.

The nginx::redirects class creates a virtual host for domain.com that redirects requests for https://domain.com to 10.10.10.10 and requests for https://domain.com/resource2 to 20.20.20.20.

The nginx::logging class creates a custom log format for the main format, which logs the request protocol, remote IP, and time taken to serve the request. It also creates a location block for the root path (/) that uses the main log format and logs to the /var/log/nginx/access.log file.

The nginx::proxy_health_check class creates a location block for the /health path that uses proxy pass to forward the request to http://localhost:8080/health, sets various proxy headers, sets a read timeout of 90 seconds, and sets the proxy_next_upstream option to error timeout which allows nginx to retry the request if there is any error or timeout.

Then these classes are included in your site manifest to use them.
