# Environment Variables

### `SERVER_NAME`

default: `app`

### `FASTCGI_PASS_HOST`

default: `127.0.0.1:9000`

### `NGINX_ERROR_LOG_LEVEL`

default: `warn`

### `USE_SSL`

default: `0`

### `SSL_PATH`

default: `/etc/letsencrypt/live/$CERTBOT_DOMAIN`

### `DH_SIZE`

default: `2048`

### `USE_CERTBOT`

default: `0`

### `CERTBOT_EMAIL`

default: `empty`

### `CERTBOT_DOMAIN`

default: `$SERVER_NAME`
