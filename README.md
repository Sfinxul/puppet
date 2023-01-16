# Puppet nginx module
This is a repo for puppet modules and tests

This nginx Puppet module creates a configuration file that redirects requests for https://domain.com to 10.10.10.10 and https://domain.com/resource2 to 20.20.20.20. The log_format and access_log lines configure Nginx to log the request protocol, remote IP, and time taken to serve the request.
It also includes a healthcheck by telling Nginx to perform a GET request to the /health endpoint on each of the backend servers and will consider them healthy if they return a 200 status.
