# Environment Variables

### `SERVER_NAME`

The default domain name (TLD) of your application.

default: `app`

### `FASTCGI_PASS_HOST`

The `host:port` or `socket` that Nginx will use to connect to PHP.

default: `127.0.0.1:9000`

### `NGINX_ERROR_LOG_LEVEL`

The error reporting level for nginx logs.

default: `warn`

### `USE_HTTP`

Allow HTTP (NON-SSL) traffic.

This will cause `#http;#` comments to be removed from `/etc/nginx/nginx.conf.template` during startup.

default: `1`

### `USE_HTTPS`

Allow HTTPS (SSL) traffic.

This will cause `#https;#` comments to be removed from `/etc/nginx/nginx.conf.template` during startup.

Note if you use the default `nginx.conf.template` with `USE_HTTP=0` and `USE_HTTPS=1` then port `80` will be available for `certbot`. Other routes will be forwarded to port `443`.

default: `0`

### `DH_SIZE`

The size of the `dhparam.pem` file.

default: `2048`

